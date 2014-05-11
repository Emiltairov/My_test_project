module Refinery
  module Feedbacks
    class Setting < Refinery::Core::BaseModel

      has_many :feedbacks

      attr_accessible :mail_adm, :question, :mail_otd, :conf_mail, :position
       validates :question, :presence => true
       validates :mail_otd,   :email => { :mx => true }
    end
  end
end
