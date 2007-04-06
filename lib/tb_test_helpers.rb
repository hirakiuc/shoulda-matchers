require 'active_record_helpers'
require 'context'
require 'general'
require 'yaml'

config_file = "tb_test_helpers.conf"
config_file = defined?(RAILS_ROOT) ? File.join(RAILS_ROOT, "test", "tb_test_helpers.conf") : File.join("test", "tb_test_helpers.conf")

tb_test_options = (YAML.load_file(config_file) rescue {}).symbolize_keys
require 'color' if tb_test_options[:color]

module Test # :nodoc:
  module Unit # :nodoc:
    class TestCase

      include ThoughtBot::TestHelpers::General::InstanceMethods

      class << self
        include ThoughtBot::TestHelpers::Context
        include ThoughtBot::TestHelpers::ActiveRecord
        include ThoughtBot::TestHelpers::General::ClassMethods    
      end
    end
  end
end

