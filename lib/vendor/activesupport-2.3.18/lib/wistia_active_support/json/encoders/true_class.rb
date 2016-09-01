class TrueClass
  AS_JSON = WistiaActiveSupport::JSON::Variable.new('true').freeze

  def as_json(options = nil) #:nodoc:
    AS_JSON
  end
end
