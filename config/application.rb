require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module JhanasClub
  class Application < Rails::Application
    config.load_defaults 8.0
    
    # Set application time zone
    config.time_zone = 'UTC'
    
    # Enable CORS for API if needed
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get]
      end
    end

    # Custom configuration
    config.x.site_name = 'Jhanas Club'
    config.x.meta_description = 'A curated collection of resources for jhana meditation practices'
    
    # Configure ActiveAdmin
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore
    
    # Background jobs configuration
    config.active_job.queue_adapter = :solid_queue
  end
end