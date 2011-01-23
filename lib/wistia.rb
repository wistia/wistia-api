require 'config'
require 'active_resource'
require 'wistia/base'
require 'wistia/media'
require 'wistia/project'
require 'wistia/projects/sharing'

module Wistia

  # Specifies a new configuration to use for the API.
  # Accepts either a Hash or a String pointing to a YAML configuration file.
  #
  # Example using a Hash:
  #   Wistia.use_config!(:wistia => { :api => { :key => 'your-api-key', :format => 'json-or-xml' } })
  def self.use_config!(config)
    if config.is_a?(String) && File.exists?(config) && File.extname(config) == '.yml'
      configatron.configure_from_yaml(config)
    elsif config.is_a?(Hash)
      configatron.configure_from_hash(config)
    else
      raise ArgumentError, 'Invalid config'
    end

    refresh_config!
  end

  # Set your API password using this method.
  # For instructions to find your API password, go here: http://wistia.com/doc/api-enable
  def self.password=(pw)
    use_config!(:wistia => { :api => { :key => pw } })
  end

  # Set the format that the API uses to either 'json' or 'xml'.
  # Accepts either a String or a Symbol.
  def self.format=(fmt)
    valid_formats = [ :json, :xml ]
    raise ArgumentError, "Invalid format.  Supported formats: #{valid_formats.join(', ')}." unless valid_formats.include?(fmt.to_sym)
    use_config!(:wistia => { :api => { :format => fmt.to_sym } })
  end

  # Force each ActiveResource descendant to re-read its configuration from the configatron.
  def self.refresh_config!
    Wistia::Media.refresh_config!
    Wistia::Project.refresh_config!
    Wistia::Projects::Sharing.refresh_config!
  end

end

