require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = 'wistia-api'
  gem.homepage = 'http://github.com/wistia/wistia-api'
  gem.license = 'MIT'
  gem.summary = 'Ruby wrapper for Wistia\'s API'
  gem.description = 'A ruby library for working with Wistia\'s data API.'
  gem.email = 'support@wistia.com'
  gem.authors = ['Jeff Vincent', 'Jim Bancroft', 'Mark Bates', 'Robby Grossman']
  gem.post_install_message = %q{
Please ensure you are running ActiveResource 2.3.0 or greater. You can check
the version by running `bundle list | grep activeresource`. For details on why
we don't enforce this via bundler, see https://github.com/wistia/wistia-api/issues/20
}
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "wistia-api #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
