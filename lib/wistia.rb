require 'config'
require 'active_resource'
require 'wistia/base'
require 'wistia/media'
require 'wistia/project'

module Wistia
  def self.password=(pw)
    Wistia::Media.password = pw
    Wistia::Project.password = pw
  end
end
