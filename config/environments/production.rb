Rails.application.configure do
  config.action_controller.perform_caching = true
  config.active_support.deprecation = :notify
  config.assets.compile = true
  config.assets.digest = false
  config.assets.js_compressor = :uglifier
  config.assets.version = '1.0'

  config.cache_classes = true
  config.consider_all_requests_local = false

  config.eager_load = true

  config.serve_static_assets = true

  config.log_formatter = ::Logger::Formatter.new
  config.log_level = :info

  config.i18n.fallbacks = true
end
