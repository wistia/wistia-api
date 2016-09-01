module WistiaActiveSupport
  class ModelName < String
    attr_reader :singular, :plural, :element, :collection, :partial_path
    alias_method :cache_key, :collection

    def initialize(name)
      super
      @singular = WistiaActiveSupport::Inflector.underscore(self).tr('/', '_').freeze
      @plural = WistiaActiveSupport::Inflector.pluralize(@singular).freeze
      @element = WistiaActiveSupport::Inflector.underscore(ActiveSupport::Inflector.demodulize(self)).freeze
      @collection = WistiaActiveSupport::Inflector.tableize(self).freeze
      @partial_path = "#{@collection}/#{@element}".freeze
    end
  end

  module CoreExtensions
    module Module
      # Returns an WistiaActiveSupport::ModelName object for module. It can be
      # used to retrieve all kinds of naming-related information.
      def model_name
        @model_name ||= ::WistiaActiveSupport::ModelName.new(name)
      end
    end
  end
end
