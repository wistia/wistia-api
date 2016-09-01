require 'test/unit/testcase'
require 'wistia_active_support/testing/setup_and_teardown'
require 'wistia_active_support/testing/assertions'
require 'wistia_active_support/testing/deprecation'
require 'wistia_active_support/testing/declarative'

begin
  gem 'mocha', ">= 0.9.7"
  require 'mocha'
rescue LoadError
  # Fake Mocha::ExpectationError so we can rescue it in #run. Bleh.
  Object.const_set :Mocha, Module.new
  Mocha.const_set :ExpectationError, Class.new(StandardError)
end

module WistiaActiveSupport
  class TestCase < ::Test::Unit::TestCase
    if defined? MiniTest
      Assertion = MiniTest::Assertion
      alias_method :method_name, :name if method_defined? :name
      alias_method :method_name, :__name__ if method_defined? :__name__
    else
      # TODO: Figure out how to get the Rails::BacktraceFilter into minitest/unit
      if defined?(Rails) && ENV['BACKTRACE'].nil?
        require 'rails/backtrace_cleaner'
        Test::Unit::Util::BacktraceFilter.module_eval { include Rails::BacktraceFilterForTestUnit }
      end

      Assertion = Test::Unit::AssertionFailedError

      require 'wistia_active_support/testing/default'
      include WistiaActiveSupport::Testing::Default
    end

    include WistiaActiveSupport::Testing::SetupAndTeardown
    include WistiaActiveSupport::Testing::Assertions
    include WistiaActiveSupport::Testing::Deprecation
    extend WistiaActiveSupport::Testing::Declarative
  end
end
