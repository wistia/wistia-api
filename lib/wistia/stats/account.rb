module Wistia
  module Stats
    class Account < Wistia::Stats::Base

      # to make it easier to find singleton
      def self.find_singleton
        find :one, :from => '/v1/stats/account.json'
      end

    end
  end
end
