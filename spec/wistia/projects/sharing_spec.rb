require 'spec_helper'

module Wistia
  module Projects
    describe Sharing do
      describe 'refresh_config!' do
        it 'overrides the site value to indicate nesting under projects' do
          api_url = Wistia::Config.config.api.url
          Wistia::Projects::Sharing.should_receive(:site=).with(api_url).ordered

          Wistia::Projects::Sharing.should_receive(:site=).with("#{api_url}projects/:project_id/").ordered
          Wistia::Projects::Sharing.refresh_config!
        end
      end
    end
  end
end
