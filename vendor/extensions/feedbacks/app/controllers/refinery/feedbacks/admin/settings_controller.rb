module Refinery
  module Feedbacks
    module Admin
      class SettingsController < ::Refinery::AdminController

        crudify :'refinery/feedbacks/setting',
                :title_attribute => 'mail_adm',
                :xhr_paging => true

      end
    end
  end
end
