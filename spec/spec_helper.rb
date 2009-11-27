dir = File.dirname(__FILE__)
$LOAD_PATH.unshift "#{dir}/../lib"

require 'compiler'

Spec::Runner.configure do |config|
  config.mock_with :rr
end
