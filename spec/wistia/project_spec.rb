require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Wistia::Project do
  it 'finds the project' do
    FakeWeb.register_uri :get, 'https://api:foo@api.wistia.com/v1/projects/7.json', body: {name: 'object name'}.to_json
    Wistia.password = 'foo'
    Wistia.format = :json
    Wistia::Project.find(7).name.should == 'object name'
  end
end
