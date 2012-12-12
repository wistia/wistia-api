# Workaround for a problem with configatron in JRuby 1.7+
# Contributors have suggested a solution at
# https://github.com/markbates/configatron/pull/33
# but the patch has not been applied for months

def running_jruby_1_7_or_later
  RUBY_PLATFORM == 'java' && !JRUBY_VERSION.match(/[0-1]\.[0-6]/)
end

if running_jruby_1_7_or_later && !defined? Psych::Yecht
  module Psych
    module Yecht
      MergeKey = Psych::Syck
    end
  end
end

require 'configatron'

configatron.wistia.api.key = ''
configatron.wistia.api.user = 'api'
configatron.wistia.api.format = :json
configatron.wistia.api.url = 'https://api.wistia.com/v1/'

