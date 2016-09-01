require 'wistia_active_support/core_ext/integer/even_odd'
require 'wistia_active_support/core_ext/integer/inflections'
require 'wistia_active_support/core_ext/integer/time'

class Integer #:nodoc:
  include WistiaActiveSupport::CoreExtensions::Integer::EvenOdd
  include WistiaActiveSupport::CoreExtensions::Integer::Inflections
  include WistiaActiveSupport::CoreExtensions::Integer::Time
end
