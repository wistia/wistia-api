require 'wistia_active_support/core_ext/cgi/escape_skipping_slashes'

class CGI #:nodoc:
  extend WistiaActiveSupport::CoreExtensions::CGI::EscapeSkippingSlashes
end
