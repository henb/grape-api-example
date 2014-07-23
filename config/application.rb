require File.expand_path('../boot', __FILE__)

require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)

module GrapeApiExample
  class Application < Rails::Application

    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]

    config.generators do |g|
      g.test_framework false
      g.integration_tool false
      g.fixture_replacement false
      g.template_engine :slim
      g.assets false
      g.helper false
      g.jbuilder false
    end
  end
end
