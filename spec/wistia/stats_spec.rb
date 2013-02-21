require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Wistia::Stats::Event do
  it 'finds the event' do
    FakeWeb.register_uri :get, 'https://api:foo@api.wistia.com/v1/stats/events/7.json', body: {name: 'object name'}.to_json
    Wistia.password = 'foo'
    Wistia.format = :json
    Wistia::Stats::Event.find(7).name.should == 'object name'
  end
end
describe Wistia::Stats::Media do
  it 'finds the media' do
    FakeWeb.register_uri :get, 'https://api:foo@api.wistia.com/v1/stats/medias/7.json', body: {name: 'object name'}.to_json
    Wistia.password = 'foo'
    Wistia.format = :json
    Wistia::Stats::Media.find(7).name.should == 'object name'
  end
end
describe Wistia::Stats::Project do
  it 'finds the project' do
    FakeWeb.register_uri :get, 'https://api:foo@api.wistia.com/v1/stats/projects/7.json', body: {name: 'object name'}.to_json
    Wistia.password = 'foo'
    Wistia.format = :json
    Wistia::Stats::Project.find(7).name.should == 'object name'
  end
end
describe Wistia::Stats::Visitor do
  it 'finds the visitor' do
    FakeWeb.register_uri :get, 'https://api:foo@api.wistia.com/v1/stats/visitors/7.json', body: {name: 'object name'}.to_json
    Wistia.password = 'foo'
    Wistia.format = :json
    Wistia::Stats::Visitor.find(7).name.should == 'object name'
  end
end
describe Wistia::Stats::Account do
  describe '#find_singleton' do
    it 'finds the account' do
      FakeWeb.register_uri :get, 'https://api:foo@api.wistia.com/v1/stats/account.json', body: {name: 'account name'}.to_json
      Wistia.password = 'foo'
      Wistia.format = :json
      Wistia::Stats::Account.find_singleton.name.should == 'account name'
    end
  end
end
