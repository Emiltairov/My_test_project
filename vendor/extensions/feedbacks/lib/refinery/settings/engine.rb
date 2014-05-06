module Refinery
  module Feedbacks
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Feedbacks

      engine_name :refinery_feedbacks

      initializer "register refinerycms_settings plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "settings"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.feedbacks_admin_settings_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/feedbacks/setting',
            :title => 'mail_adm'
          }
          plugin.menu_match = %r{refinery/feedbacks/settings(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Settings)
      end
    end
  end
end
