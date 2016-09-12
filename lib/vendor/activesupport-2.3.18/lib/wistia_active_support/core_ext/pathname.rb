require 'pathname'
require 'wistia_active_support/core_ext/pathname/clean_within'

class Pathname#:nodoc:
  extend WistiaActiveSupport::CoreExtensions::Pathname::CleanWithin
end

