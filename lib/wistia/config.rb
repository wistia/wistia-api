require 'wistia/initialization'

module Wistia
  # Specifies a new configuration to use for the API.
  # Accepts either a Hash or a String pointing to a YAML configuration file.
  #
  # Example using a Hash:
  #   Wistia.use_config!(:wistia => { :api => { :key => 'your-api-key', :format => 'json-or-xml' } })
  def self.use_config!(config)
    if config.is_a?(String) && File.exists?(config) && File.extname(config) == '.yml'
      self.use_config!(YAML.load_file(config))
    elsif config.is_a?(Hash)
      config = config.with_indifferent_access
      if data_hash = config && config[:wistia] && config[:wistia][:api]
        # We need to support :key and :password as hash keys because we used to. We should deprecate :key.
        new_password = data_hash[:password] || data_hash[:key]
        self.password = new_password unless new_password.nil?
        new_format = data_hash[:format]
        self.format = new_format.to_sym unless new_format.nil?
      end
    else
      raise ArgumentError, 'Invalid config'
    end
  end

  # Set your API password using this method.
  # For instructions to find your API password, go here: http://wistia.com/doc/api-enable
  def self.password= (new_password)
    @@password = new_password
    Wistia.refresh_config_for_wistia_api_objects!
    @@password
  end
  def self.password; @@password; end

  # Set the format that the API uses to either 'json' or 'xml'.
  # Accepts either a String or a Symbol.
  def self.format=(new_format)
    valid_formats = [:json, :xml]
    raise ArgumentError, "Invalid format.  Supported formats: #{valid_formats.join(', ')}." unless valid_formats.include?(new_format.to_sym)
    @@format = new_format
    Wistia.refresh_config_for_wistia_api_objects!
    @@format
  end
  def self.format; @@format; end

  def self.wistia_api_objects
    ObjectSpace.each_object(Class).select{|klass| klass < Wistia::Base} << Wistia::Base
  end
  def self.refresh_config_for_wistia_api_objects!
    self.wistia_api_objects.each {|d| d.refresh_config!}
  end
end

require 'wistia/base' # We want wistia/config to load before wistia/base, but we also want
                      # to ensure wistia/base is loaded so that #wistia_api_objects and
                      # refresh_config_for_wistia_api_objects! works.
