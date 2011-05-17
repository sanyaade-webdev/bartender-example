require File.expand_path("../boot", __FILE__)
require "action_controller/railtie"

Bundler.require(:default, Rails.env) if defined?(Bundler)

module BartenderExample
  class Application < Rails::Application
    config.encoding  = "utf-8"
    config.time_zone = "UTC"
  end
end
