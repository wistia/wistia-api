%w(keys indifferent_access deep_merge reverse_merge conversions diff slice except).each do |ext|
  require "wistia_active_support/core_ext/hash/#{ext}"
end

class Hash #:nodoc:
  include WistiaActiveSupport::CoreExtensions::Hash::Keys
  include WistiaActiveSupport::CoreExtensions::Hash::IndifferentAccess
  include WistiaActiveSupport::CoreExtensions::Hash::DeepMerge
  include WistiaActiveSupport::CoreExtensions::Hash::ReverseMerge
  include WistiaActiveSupport::CoreExtensions::Hash::Conversions
  include WistiaActiveSupport::CoreExtensions::Hash::Diff
  include WistiaActiveSupport::CoreExtensions::Hash::Slice
  include WistiaActiveSupport::CoreExtensions::Hash::Except
end
