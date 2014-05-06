module Refinery
  module Feedbacks
    class Setting < Refinery::Core::BaseModel

      attr_accessible :mail_adm, :question, :mail_otd, :conf_mail, :position

      validates :mail_adm, :presence => true, :uniqueness => true
    end
  end
end
