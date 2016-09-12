require 'wistia_active_support/core_ext/range/conversions'
require 'wistia_active_support/core_ext/range/overlaps'
require 'wistia_active_support/core_ext/range/include_range'
require 'wistia_active_support/core_ext/range/blockless_step'

class Range #:nodoc:
  include WistiaActiveSupport::CoreExtensions::Range::Conversions
  include WistiaActiveSupport::CoreExtensions::Range::Overlaps
  include WistiaActiveSupport::CoreExtensions::Range::IncludeRange
  include WistiaActiveSupport::CoreExtensions::Range::BlocklessStep
end
