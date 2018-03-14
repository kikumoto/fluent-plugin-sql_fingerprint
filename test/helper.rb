require 'test/unit'
require 'fluent/log'
require 'fluent/test'
require 'fluent/test/driver/filter'

unless defined?(Test::Unit::AssertionFailedError)
  class Test::Unit::AssertionFailedError < StandardError
  end
end
