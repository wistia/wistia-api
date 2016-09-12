# encoding: utf-8

require 'wistia_active_support/core_ext/string/inflections'
require 'wistia_active_support/core_ext/string/bytesize'
require 'wistia_active_support/core_ext/string/conversions'
require 'wistia_active_support/core_ext/string/access'
require 'wistia_active_support/core_ext/string/starts_ends_with'
require 'wistia_active_support/core_ext/string/iterators'
require 'wistia_active_support/core_ext/string/multibyte'
require 'wistia_active_support/core_ext/string/xchar'
require 'wistia_active_support/core_ext/string/filters'
require 'wistia_active_support/core_ext/string/behavior'
require 'wistia_active_support/core_ext/string/output_safety'

class String #:nodoc:
  include WistiaActiveSupport::CoreExtensions::String::Access
  include WistiaActiveSupport::CoreExtensions::String::Conversions
  include WistiaActiveSupport::CoreExtensions::String::Filters
  include WistiaActiveSupport::CoreExtensions::String::Inflections
  include WistiaActiveSupport::CoreExtensions::String::StartsEndsWith
  include WistiaActiveSupport::CoreExtensions::String::Iterators
  include WistiaActiveSupport::CoreExtensions::String::Behavior
  include WistiaActiveSupport::CoreExtensions::String::Multibyte
end
