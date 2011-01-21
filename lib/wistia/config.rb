module Wistia

  class << self

    def config(&block)
      Wistia::Config.config(&block)
    end

  end

  module Config

    class << self

      def config(&block)
        yield configatron.wistia if block_given?
        configatron.wistia
      end

    end

  end

end

