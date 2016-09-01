module WistiaActiveResource
  module Formats
    # Lookup the format class from a mime type reference symbol. Example:
    #
    #   WistiaActiveResource::Formats[:xml]  # => ActiveResource::Formats::XmlFormat
    #   WistiaActiveResource::Formats[:json] # => ActiveResource::Formats::JsonFormat
    def self.[](mime_type_reference)
      WistiaActiveResource::Formats.const_get(mime_type_reference.to_s.camelize + "Format")
    end
  end
end

require 'wistia_active_resource/formats/xml_format'
require 'wistia_active_resource/formats/json_format'