require 'spec_helper'

module Wistia
  describe Base do
    describe 'refresh_config!' do
      it 'sets the "site" public class attribute' do
        Wistia::Base.should_receive(:site=)
        Wistia::Base.refresh_config!
      end

      it 'sets the "user" public class attribute' do
        Wistia::Base.should_receive(:user=)
        Wistia::Base.refresh_config!
      end

      it 'sets the "password" public class attribute' do
        Wistia::Base.should_receive(:password=)
        Wistia::Base.refresh_config!
      end

      it 'sets the "format" public class attribute' do
        Wistia::Base.should_receive(:format=)
        Wistia::Base.refresh_config!
      end
    end
  end
end

