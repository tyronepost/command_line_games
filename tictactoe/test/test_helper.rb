require 'simplecov'

SimpleCov.start do
  add_filter "/test/"
end

require 'minitest/autorun'
require 'minitest/reporters'

Dir[File.expand_path("spies/*.rb", __dir__)].each { |file| require file }
Dir[File.expand_path("stubs/*.rb", __dir__)].each { |file| require file }
Dir[File.expand_path("../lib/**/*.rb", __dir__)].each { |file| require file }

Minitest::Reporters.use!

