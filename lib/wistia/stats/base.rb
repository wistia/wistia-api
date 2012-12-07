module Wistia
  module Stats
    class Base < Wistia::Base

      # we needs to use the stats url
      def self.refresh_config!
        super
        self.site = "#{Wistia::Config.config.api.url}stats/"
      end
      refresh_config!

    end
  end
end
