File.join(File.dirname(__FILE__), "lib")

require 'rspec'

RSpec.configure do |config|
  config.failure_color = :magenta
  config.pending_color = :white
  config.detail_color = :blue
  config.tty = true
  config.color = true

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

end

# for support, i.e. active_support
# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
# Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each {|f| require f}
