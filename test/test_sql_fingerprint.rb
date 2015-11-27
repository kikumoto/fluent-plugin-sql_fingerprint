require_relative 'helper'
require 'fluent/plugin/filter_sql_fingerprint'

class SqlFingerprintFilterTest < Test::Unit::TestCase
  include Fluent

  setup do
    Test.setup
    @time = Fluent::Engine.now
  end

  def create_driver(conf = '')
    Test::FilterTestDriver.new(SqlFingerprintFilter).configure(conf, true)
  end

  def filter(d, msg)
    d.run { d.filter(msg, @time) }
    d.filtered
  end

  sub_test_case 'configure' do
    def test_finggerprint_tool_path
      assert_raise Fluent::ConfigError do
        create_driver('')
      end

      d = create_driver(%[fingerprint_tool_path a_tool])
      assert_equal "a_tool", d.instance.fingerprint_tool_path
    end
  end

  sub_test_case 'filter' do
    def test_sql_fingerprint
      sql = "SELECT * FROM hogeho"
      d = create_driver(%[fingerprint_tool_path cat])
      msg = { 'sql' => sql }
      es = filter(d, msg)
      es.each do |t, r|
        assert_equal(sql, r['sql'])
        assert_equal(sql, r['fingerprint'])
      end
    end
  end
end
