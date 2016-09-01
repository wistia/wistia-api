require 'date'
require 'wistia_active_support/core_ext/time/behavior'
require 'wistia_active_support/core_ext/time/zones'
require 'wistia_active_support/core_ext/date_time/calculations'
require 'wistia_active_support/core_ext/date_time/conversions'

class DateTime
  include WistiaActiveSupport::CoreExtensions::Time::Behavior
  include WistiaActiveSupport::CoreExtensions::Time::Zones
  include WistiaActiveSupport::CoreExtensions::DateTime::Calculations
  include WistiaActiveSupport::CoreExtensions::DateTime::Conversions
end
