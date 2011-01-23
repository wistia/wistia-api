require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Wistia do

  describe 'use_config!' do
    context 'given a hash argument' do
      it 'uses the hash to configure configatron' do
        Wistia.use_config!( :wistia => { :api => { :key => 'test' } } )
        configatron.wistia.api.key.should == 'test'
      end
    end

    context 'given a path to a yaml file' do
      it 'makes configatron use the yaml file for configuration' do
        path_to_yaml = File.dirname(__FILE__) + '/support/config.test.yml'
        configatron.should_receive(:configure_from_yaml).with(path_to_yaml)
        Wistia.use_config!(path_to_yaml)
      end
    end

    context 'given an invalid config' do
      it 'raises an ArgumentError' do
        lambda {
          Wistia.use_config!(nil)
        }.should raise_error(ArgumentError, 'Invalid config')
      end
    end

    it 'uses the new configuration' do
      Wistia.should_receive(:refresh_config!)
      Wistia.use_config!( :wistia => { :api => { :key => 'test' } } )
    end
  end

  describe 'password=' do
    it 'reconfigures the API using the new password parameter' do
      new_password = 'test'
      Wistia.password = new_password
      Wistia.should_receive(:use_config!).with(hash_including(:wistia => { :api => { :key => new_password } }))
      Wistia.password = new_password
    end
  end

  describe 'format=' do
    context 'given a valid format' do
      it 'reconfigures the API using the new format parameter' do
        new_format = :xml
        Wistia.should_receive(:use_config!).with(hash_including(:wistia => { :api => { :format => new_format } }))
        Wistia.format = new_format
      end
    end

    context 'given an invalid format' do
      it 'raises an ArgumentError' do
        lambda {
          Wistia.format = 'invalid_format'
        }.should raise_error(ArgumentError, /Invalid format/)
      end
    end
  end

  describe 'refresh_config!' do
    it 'forces Wistia::Media to re-read its configuration from the configatron' do
      Wistia::Media.should_receive(:refresh_config!)
      Wistia.refresh_config!
    end

    it 'forces Wistia::Project to re-read its configuration from the configatron' do
      Wistia::Project.should_receive(:refresh_config!)
      Wistia.refresh_config!
    end

    it 'forces Wistia::Projects::Sharing to re-read its configuration from the configatron' do
      Wistia::Projects::Sharing.should_receive(:refresh_config!)
      Wistia.refresh_config!
    end
  end
  
end

