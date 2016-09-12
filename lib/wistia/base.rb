require 'wistia/config'

module Wistia
  class Base < WistiaActiveResource::Base
    self.site = Wistia::API_BASE_URL
    self.user = 'api'

    def self.refresh_config!
      self.password = Wistia.password
      self.format = WistiaActiveResource::Formats::JsonFormat if Wistia.format == :json
      self.format = WistiaActiveResource::Formats::XmlFormat if Wistia.format == :xml
    end
    refresh_config!

    def to_json(options = {})
      self.attributes.to_json(options)
    end
  end
end
