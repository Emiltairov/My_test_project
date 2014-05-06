module Refinery
  module Feedbacks
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Feedbacks

      engine_name :refinery_feedbacks

      initializer "register refinerycms_feedbacks plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "feedbacks"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.feedbacks_admin_feedbacks_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/feedbacks/feedback',
            :title => 'email'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Feedbacks)
      end
    end
  end
end
