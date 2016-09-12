require 'bigdecimal'
require 'wistia_active_support/core_ext/bigdecimal/conversions'

class BigDecimal#:nodoc:
  include WistiaActiveSupport::CoreExtensions::BigDecimal::Conversions
end
