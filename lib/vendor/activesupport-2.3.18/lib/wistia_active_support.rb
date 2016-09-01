#--
# Copyright (c) 2005 David Heinemeier Hansson
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#++

module WistiaActiveSupport
  def self.load_all!
    [Dependencies, Deprecation, Gzip, MessageVerifier, Multibyte, SecureRandom, TimeWithZone]
  end

  autoload :BacktraceCleaner, 'wistia_active_support/backtrace_cleaner'
  autoload :Base64, 'wistia_active_support/base64'
  autoload :BasicObject, 'wistia_active_support/basic_object'
  autoload :BufferedLogger, 'wistia_active_support/buffered_logger'
  autoload :Cache, 'wistia_active_support/cache'
  autoload :Callbacks, 'wistia_active_support/callbacks'
  autoload :Deprecation, 'wistia_active_support/deprecation'
  autoload :Duration, 'wistia_active_support/duration'
  autoload :Gzip, 'wistia_active_support/gzip'
  autoload :Inflector, 'wistia_active_support/inflector'
  autoload :Memoizable, 'wistia_active_support/memoizable'
  autoload :MessageEncryptor, 'wistia_active_support/message_encryptor'
  autoload :MessageVerifier, 'wistia_active_support/message_verifier'
  autoload :Multibyte, 'wistia_active_support/multibyte'
  autoload :OptionMerger, 'wistia_active_support/option_merger'
  autoload :OrderedHash, 'wistia_active_support/ordered_hash'
  autoload :OrderedOptions, 'wistia_active_support/ordered_options'
  autoload :Rescuable, 'wistia_active_support/rescuable'
  autoload :SafeBuffer, 'wistia_active_support/core_ext/string/output_safety'
  autoload :SecureRandom, 'wistia_active_support/secure_random'
  autoload :StringInquirer, 'wistia_active_support/string_inquirer'
  autoload :TimeWithZone, 'wistia_active_support/time_with_zone'
  autoload :TimeZone, 'wistia_active_support/values/time_zone'
  autoload :XmlMini, 'wistia_active_support/xml_mini'
end

require 'wistia_active_support/vendor'
require 'wistia_active_support/core_ext'
require 'wistia_active_support/dependencies'
require 'wistia_active_support/json'

I18n.load_path << "#{File.dirname(__FILE__)}/wistia_active_support/locale/en.yml"
