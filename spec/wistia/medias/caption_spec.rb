require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Wistia::Medias::Caption do
  it 'finds captions for a given media' do
  	response = [
				  {
				    "language": "eng",
				    "text": "1\n00:00:00,500 --> 00:00:02,000\nwww.tvsubtitles.net\n\n2\n00:01:33,680 --> 00:01:35,672\nThis is Russo. Please\nleave a message.\n\n",
				    "english_name": "English",
				    "native_name": "English"
				  }]
    FakeWeb.register_uri :get, 'https://api:foo@api.wistia.com/v1/medias/7/captions.json', body: response.to_json
    Wistia.password = 'foo'
    Wistia.format = :json
    Wistia::Medias::Caption.find_by_media_id(7).first.attributes["language"].should == 'eng'
  end

  it 'creates captions for a given media' do
  	response = [
				  {
				    "language": "eng",
				    "text": "1\n00:00:00,500 --> 00:00:02,000\nwww.random-subtitles.net\n\n2\n00:01:33,680 --> 00:01:35,672\nThis is Russo. Please\nleave a message.\n\n",
				    "english_name": "English",
				    "native_name": "English"
				  }]
    FakeWeb.register_uri :post, 'https://api:foo@api.wistia.com/v1/medias/7/captions.json', params: response.to_json
    Wistia.password = 'foo'
    Wistia.format = :json
    params = { media_hashed_id: 7, caption_file: './spec/support/test.srt' }
    Wistia::Medias::Caption.create(params).attributes[:caption_file].should == './spec/support/test.srt'
  end
end
