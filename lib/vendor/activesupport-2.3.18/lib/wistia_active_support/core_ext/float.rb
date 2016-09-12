require 'wistia_active_support/core_ext/float/rounding'
require 'wistia_active_support/core_ext/float/time'

class Float #:nodoc:
  include WistiaActiveSupport::CoreExtensions::Float::Rounding
  include WistiaActiveSupport::CoreExtensions::Float::Time
end
