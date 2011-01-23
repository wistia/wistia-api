module Wistia
  module Projects
    class Sharing < Wistia::Base
        def self.refresh_config!
          super
          self.site = "#{Wistia::Config.config.api.url}projects/:project_id/"
        end

        refresh_config!
        
        def to_json(options = {})
          return self.attributes.to_json(options)
        end

    end
  end
end

