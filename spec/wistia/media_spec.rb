require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Wistia::Media do
  it 'finds the media' do
    FakeWeb.register_uri :get, 'https://api:foo@api.wistia.com/v1/medias/7.json', body: {name: 'object name'}.to_json
    Wistia.password = 'foo'
    Wistia.format = :json
    Wistia::Media.find(7).name.should == 'object name'
  end
end
