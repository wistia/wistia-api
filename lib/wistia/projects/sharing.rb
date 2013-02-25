module Wistia
  module Projects
    class Sharing < Wistia::Base
      self.site = "#{Wistia::API_BASE_URL}projects/:project_id/"

      def to_json(options = {})
        self.attributes.to_json(options)
      end
    end
  end
end
