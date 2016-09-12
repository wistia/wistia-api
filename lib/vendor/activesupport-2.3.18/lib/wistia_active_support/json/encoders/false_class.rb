class FalseClass
  AS_JSON = WistiaActiveSupport::JSON::Variable.new('false').freeze

  def as_json(options = nil) #:nodoc:
    AS_JSON
  end
end
