require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Wistia::Base do
  describe 'authentication' do
    it 'sets user to "api"' do
      Wistia::Base.user.should == 'api'
    end
    it 'sets password based on config' do
      Wistia.password = 'foo'
      Wistia::Base.password.should == 'foo'
    end
  end
  describe 'self#refresh_config!' do
    it 'updates the configuration for the class' do
      Wistia.password = 'bar'
      Wistia::Base.password = 'foo'
      Wistia::Base.password.should == 'foo'
      Wistia::Base.refresh_config!
      Wistia::Base.password.should == 'bar'
    end
  end
  describe '#to_json' do
    it 'renders attributes in json format' do
      b = Wistia::Base.new
      b.key1 = 'val1'
      b.key2 = 'val2'
      JSON.parse(b.to_json).should == {'key1' => 'val1', 'key2' => 'val2'}
    end
  end
end
