require 'spec_helper'

module Wistia
  module Stats
    describe Base do
      describe 'refresh_config!' do
        it 'overrides the site value to indicate namespacing under stats' do
          api_url = Wistia::Config.config.api.url
          Wistia::Stats::Base.should_receive(:site=).with(api_url).ordered

          Wistia::Stats::Base.should_receive(:site=).with("#{api_url}stats/").ordered
          Wistia::Stats::Base.refresh_config!
        end
      end
    end
  end
end
