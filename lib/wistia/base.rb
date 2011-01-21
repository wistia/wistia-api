require File.join(File.dirname(__FILE__), 'config')

module Wistia
  class Base < ActiveResource::Base
    self.site = Wistia::Config.config.api.url
    self.user = Wistia::Config.config.api.user
    self.password = Wistia::Config.config.api.key
    self.format = Wistia::Config.config.api.format
    
    def to_json(options = {})
      return self.attributes.to_json(options)
    end
    
  end
end
