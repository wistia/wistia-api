require 'wistia_active_support/core_ext/numeric/time'
require 'wistia_active_support/core_ext/numeric/bytes'
require 'wistia_active_support/core_ext/numeric/conversions'

class Numeric #:nodoc:
  include WistiaActiveSupport::CoreExtensions::Numeric::Time
  include WistiaActiveSupport::CoreExtensions::Numeric::Bytes
  include WistiaActiveSupport::CoreExtensions::Numeric::Conversions
end
