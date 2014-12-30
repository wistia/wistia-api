module Wistia
    module Medias
      class Customization < Wistia::Base
        self.collection_name = 'customizations'

        def self.find_by_media_id media_id
        	url = "#{Wistia::API_BASE_URL}medias/"+media_id+'/customizations.json'           
        	find :one, :from => url
        end

        def to_json(options = {})
            self.attributes.to_json(options)
        end

      end
    end
end