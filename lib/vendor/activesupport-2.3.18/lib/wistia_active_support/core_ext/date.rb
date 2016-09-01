require 'date'
require 'wistia_active_support/core_ext/date/behavior'
require 'wistia_active_support/core_ext/date/calculations'
require 'wistia_active_support/core_ext/date/conversions'

class Date#:nodoc:
  include WistiaActiveSupport::CoreExtensions::Date::Behavior
  include WistiaActiveSupport::CoreExtensions::Date::Calculations
  include WistiaActiveSupport::CoreExtensions::Date::Conversions
end
