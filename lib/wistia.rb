$:.unshift "#{File.dirname(__FILE__)}/vendor/activeresource-2.3.18/lib"
$:.unshift "#{File.dirname(__FILE__)}/vendor/activesupport-2.3.18/lib"

require 'wistia_active_resource'

require 'wistia/initialization'
require 'wistia/config'
require 'wistia/base'
require 'wistia/media'
require 'wistia/project'
require 'wistia/projects/sharing'
require 'wistia/stats'
