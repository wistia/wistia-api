module WistiaActiveResource
  module Formats
    module JsonFormat
      extend self

      def extension
        "json"
      end

      def mime_type
        "application/json"
      end

      def encode(hash, options = nil)
        WistiaActiveSupport::JSON.encode(hash, options)
      end

      def decode(json)
        WistiaActiveSupport::JSON.decode(json)
      end
    end
  end
end
