class String
  def to_json(options = nil) #:nodoc:
    WistiaActiveSupport::JSON::Encoding.escape(self)
  end

  def as_json(options = nil) #:nodoc:
    self
  end
end
