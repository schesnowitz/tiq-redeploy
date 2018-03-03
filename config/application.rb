require_relative 'boot'

require 'rails/all'
require 'csv'
require 'carrierwave'

Bundler.require(*Rails.groups)

module Fquote
  class Application < Rails::Application
  config.autoload_paths << Rails.root.join("lib")
  config.active_job.queue_adapter = :sidekiq
  # config.active_job.queue_name_prefix = "fr8track"
  # config.active_job.queue_name_delimiter = "_"
  # config.active_job.queue_adapter = Rails.env.production? ? :sidekiq : async # runs only in production
  

  end
end
