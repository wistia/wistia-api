require 'wistia/config'

module Wistia
  class Base < ActiveResource::Base
    self.site = Wistia::API_BASE_URL
    self.user = 'api'

    def self.refresh_config!
      self.password = Wistia.password
      self.format = ActiveResource::Formats::JsonFormat if Wistia.format == :json
      self.format = ActiveResource::Formats::XmlFormat if Wistia.format == :xml
    end
    refresh_config!

    def to_json(options = {})
      self.attributes.to_json(options)
    end
  end
end
