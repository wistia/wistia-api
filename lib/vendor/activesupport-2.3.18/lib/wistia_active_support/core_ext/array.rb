require 'wistia_active_support/core_ext/array/access'
require 'wistia_active_support/core_ext/array/conversions'
require 'wistia_active_support/core_ext/array/extract_options'
require 'wistia_active_support/core_ext/array/grouping'
require 'wistia_active_support/core_ext/array/random_access'
require 'wistia_active_support/core_ext/array/wrapper'

class Array #:nodoc:
  include WistiaActiveSupport::CoreExtensions::Array::Access
  include WistiaActiveSupport::CoreExtensions::Array::Conversions
  include WistiaActiveSupport::CoreExtensions::Array::ExtractOptions
  include WistiaActiveSupport::CoreExtensions::Array::Grouping
  include WistiaActiveSupport::CoreExtensions::Array::RandomAccess
  extend WistiaActiveSupport::CoreExtensions::Array::Wrapper
end
