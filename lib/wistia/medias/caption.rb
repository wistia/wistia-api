module Wistia
  module Medias
    class Caption < Wistia::Base
      self.site = "#{Wistia::API_BASE_URL}medias/:media_hashed_id"
      self.collection_name = 'captions'

      def self.find_by_media_id media_hashed_id
        url = "#{Wistia::API_BASE_URL}medias/#{media_hashed_id}/captions.json"
        find :all, :from => url
      end

      def to_json(options = {})
        self.attributes.to_json(options)
      end

    end
  end
end
