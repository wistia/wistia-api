module Wistia
  class Media < Wistia::Base
    self.collection_name = 'medias'

    def still(width = 640, options = {})
      options = {:format => 'jpg', :style => 'image_resize'}.merge(options)
      matcher = self.type == 'Image' ? /OriginalFile/ : /StillImage/
      self.assets.each do |asset|
        if asset.type.match(matcher)
          url = asset.url.gsub(/\.bin$/, ".#{options[:format]}?#{options[:style]}=#{width}")
          return url
        end
      end

      nil
    end

    def previous_video(collection)
      collection[media_hash(collection)[self.id] - 1]
    end

    def next_video(collection)
      collection[media_hash(collection)[self.id] + 1]
    end

    def permalink
      URI::encode(self.name.downcase.gsub(" ", "-"))
    end

    private

    def media_hash(collection)
      media_id_array = collection.map(&:id)
      Hash[media_id_array.map.with_index.to_a]
    end
  end
end
