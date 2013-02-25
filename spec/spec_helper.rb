$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'fakeweb'
require 'wistia'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configuration.before :each do
  # Disallow real web connections; run each time in case a test overrides it.
  FakeWeb.allow_net_connect = false

  # Simulate a clean Wistia class for each spec
  [:@@password, :@@format].each do |class_var|
    Wistia.remove_class_variable(class_var) if Wistia.class_variable_defined?(class_var)
    Wistia.class_variable_set class_var, nil
  end
end
