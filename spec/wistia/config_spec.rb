require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Wistia do
  describe 'self#wistia_api_objects' do
    it 'returns array of classes that inherit from Wistia::Base' do
      expected_descendants = [
        Wistia::Base,
        Wistia::Media,
        Wistia::Project,
        Wistia::Projects::Sharing,
        Wistia::Stats::Base,
        Wistia::Stats::Account,
        Wistia::Stats::Media,
        Wistia::Stats::Event,
        Wistia::Stats::Project,
        Wistia::Stats::Visitor,
      ]

      expected_descendants.each {|ed| Wistia.wistia_api_objects.should include(ed)}
      Wistia.wistia_api_objects.count.should == expected_descendants.count
    end
  end

  describe 'use_config!' do
    context 'given a hash argument' do
      it 'sets the password from the hash' do
        Wistia.password.should be_nil
        Wistia.use_config!( :wistia => { :api => { :password => 'test' } } )
        Wistia.password.should == 'test'
      end
      it 'sets the password from the hash when supplied as \'key\'' do
        Wistia.password.should be_nil
        Wistia.use_config!( :wistia => { :api => { :key => 'test' } } )
        Wistia.password.should == 'test'
      end
      it 'sets the format in symbolic form from the hash' do
        Wistia.format.should be_nil
        Wistia.use_config!( :wistia => { :api => { :format => 'xml' } } )
        Wistia::Base.format.should == ActiveResource::Formats::XmlFormat
        Wistia.format.should == :xml
        Wistia.use_config!( :wistia => { :api => { :format => 'json' } } )
        Wistia::Base.format.should == ActiveResource::Formats::JsonFormat
        Wistia.format.should == :json
      end
      it 'leaves format alone when setting only password' do
        Wistia.format = :xml
        Wistia.use_config!( :wistia => { :api => { :password => 'foo' } } )
        Wistia.format.should == :xml
      end
      it 'leaves password alone when setting only format' do
        Wistia.password = 'foo'
        Wistia.use_config!( :wistia => { :api => { :format => 'xml' } } )
        Wistia.password.should == 'foo'
      end
    end

    context 'given a path to a yaml file' do
      it 'uses the yaml file for configuration' do
        path_to_yaml = File.dirname(__FILE__) + '/../support/config.test.yml'
        Wistia.use_config!(path_to_yaml)
        Wistia.password.should == 'test'
        Wistia.format.should == :json
      end
    end

    context 'given an invalid config' do
      it 'raises an ArgumentError' do
        lambda {
          Wistia.use_config!(nil)
        }.should raise_error(ArgumentError, 'Invalid config')
      end
    end
  end
end