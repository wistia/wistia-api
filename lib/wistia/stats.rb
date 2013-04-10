module Wistia
  module Stats
    class Base < Wistia::Base
      self.site = "#{Wistia::API_BASE_URL}stats/"
    end

    class Account < Wistia::Stats::Base
      # to make it easier to find singleton
      def self.find_singleton
        find :one, :from => '/v1/stats/account.json'
      end
    end
    class Event < Wistia::Stats::Base
    end
    class Media < Wistia::Stats::Base
      self.collection_name = 'medias'
    end
    class Project < Wistia::Stats::Base
    end
    class Visitor < Wistia::Stats::Base
    end
  end
end
