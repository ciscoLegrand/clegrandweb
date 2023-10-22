require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Clegrandweb
  class Application < Rails::Application
    config.load_defaults Rails::VERSION::STRING.to_f

    config.autoload_lib(ignore: %w(assets tasks))

    config.time_zone = 'Europe/Madrid'

    config.i18n.load_path += Dir[Rails.root.join('app', 'components', '**', '*.yml')]
    config.i18n.available_locales = %i[es en]
    config.i18n.default_locale = :en
    config.i18n.fallbacks = true
    config.generators do |gen|
      gen.assets            false
      gen.helper            false
      gen.test_framework    'false'
      gen.jbuilder          true
      gen.orm               :active_record, primary_key_type: :uuid
      gen.system_tests      false
    end
    config.session_store :cache_store,  key: '_cle_session'
    config.session_store :cookie_store, key: '_cle_session'

    config.active_storage.variant_processor = :vips
  end
end
