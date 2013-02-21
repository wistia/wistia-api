require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Wistia::Projects::Sharing do
  describe '#find' do
    it 'finds the sharing under the project' do
      FakeWeb.register_uri :get, 'https://api:foo@api.wistia.com/v1/projects/3/sharings/7.json', body: {name: 'sharing name'}.to_json
      Wistia.password = 'foo'
      Wistia.format = :json
      Wistia::Projects::Sharing.find(7, params:{project_id: 3}).name.should == 'sharing name'
    end
  end
  describe '#to_json' do
    it 'renders attributes in json format' do
      b = Wistia::Projects::Sharing.new
      b.key1 = 'val1'
      b.key2 = 'val2'
      JSON.parse(b.to_json).should == {'key1' => 'val1', 'key2' => 'val2'}
    end
  end
end
