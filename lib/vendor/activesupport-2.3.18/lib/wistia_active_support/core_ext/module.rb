require 'wistia_active_support/core_ext/module/inclusion'
require 'wistia_active_support/core_ext/module/attribute_accessors'
require 'wistia_active_support/core_ext/module/attr_internal'
require 'wistia_active_support/core_ext/module/attr_accessor_with_default'
require 'wistia_active_support/core_ext/module/delegation'
require 'wistia_active_support/core_ext/module/introspection'
require 'wistia_active_support/core_ext/module/loading'
require 'wistia_active_support/core_ext/module/aliasing'
require 'wistia_active_support/core_ext/module/model_naming'
require 'wistia_active_support/core_ext/module/synchronization'

module WistiaActiveSupport
  module CoreExtensions
    # Various extensions for the Ruby core Module class.
    module Module
      # Nothing here. Only defined for API documentation purposes.
    end
  end
end

class Module
  include WistiaActiveSupport::CoreExtensions::Module
end
