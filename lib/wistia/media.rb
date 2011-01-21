module Wistia
  class Media < Wistia::Base

=begin
    class << self
      def find_with_cache(id)
        return nil if id.nil?
        Wistia::Media::Cache.get(id) do |key|
          media = Wistia::Media.find_without_cache(key)
          Wistia::Media::Cache.set(key, media) if media.progress >= 1.0
          media
        end
      end
      alias_method_chain :find, :cache
    end
=end

    def still(width = 640, options = {})
      options = {:format => 'jpg', :style => 'image_resize'}.merge(options)
      matcher = self.type == 'Image' ? /OriginalFile/ : /StillImage/
      self.assets.each do |asset|
        if asset.type.match(matcher)
          url = asset.url.gsub(/\.bin$/, ".#{options[:format]}?#{options[:style]}=#{width}")
          return url
        end
      end
      return nil
    end

    # Needed when deserializing from cache:
    class Thumbnail < Wistia::Base
    end # Thumbnail

    # Needed when deserializing from cache:
    class Asset < Wistia::Base
    end # Asset

  end # Media
end # Wistia

