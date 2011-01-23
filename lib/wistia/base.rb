require File.join(File.dirname(__FILE__), 'config')

module Wistia
  class Base < ActiveResource::Base
    # Resets all the ActiveResource configuration options to what's currently stored in the configatron.
    def self.refresh_config!
      self.site = Wistia::Config.config.api.url
      self.user = Wistia::Config.config.api.user
      self.password = Wistia::Config.config.api.key
      self.format = Wistia::Config.config.api.format.to_sym
    end

    refresh_config!
    
    def to_json(options = {})
      return self.attributes.to_json(options)
    end
    
  end
end

