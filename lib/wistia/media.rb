module Wistia
  class Media < Wistia::Base

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

