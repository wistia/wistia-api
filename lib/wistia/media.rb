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
  end
end
