require "open3"
require 'fluent/plugin/filter'

module Fluent::Plugin
  class SqlFingerprintFilter < Fluent::Plugin::Filter
    Fluent::Plugin.register_filter('sql_fingerprint', self)

    config_param :fingerprint_tool_path, :string
    config_param :target_key, :string, :default => 'sql'
    config_param :added_key, :string, :default => 'fingerprint'

    def configure(conf)
      super
    end

    def start
      super
    end

    def shutdown
      super
    end

    def filter(tag, time, record)
      sql = hash_get(record, @target_key)
      if !sql.nil? && !sql.empty?
        record[@added_key] = fingerprint(sql)
      end
      record
    end

    def fingerprint(sql)
      unless sql.empty?
        o, s = Open3.capture2(@fingerprint_tool_path, :stdin_data => sql)
        if s.success?
          o.chomp!
          sql = o unless o.empty? 
        end
      end
      sql
    end

    def hash_get(hash, key)
      return hash[key.to_sym] if hash.key?(key.to_sym)
      return hash[key] if hash.key?(key)
      nil
    end
  end
end
