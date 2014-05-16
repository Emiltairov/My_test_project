module Refinery
  module Feedbacks
    class Feedback < Refinery::Core::BaseModel
      self.table_name = 'refinery_feedbacks'
  #=>тут капчер
      has_secure_password
      validates_presence_of :password, on: :create
  #=>тут капчер

      belongs_to :setting

      attr_accessible :name, :email, :phone, :message,:question, :requestion, :position
      after_create  :send_notfication

      def send_notfication
              begin
  	FeedbackMailer.notification(@feedback).deliver 
            rescue
              logger.warn "There was an error delivering an feedback notification.\n#{$!}\n"
            end 
      end 

      validates :name, :presence => true
  #=>        validates :email,   :email => { :mx => true }   #=>  рабочая+МХ
  #=>  тест лямбды.работает
             validates :email, :email => { :mx => true }, :if => lambda { |feedback| feedback.phone.blank? }
             validates :phone, :presence => true, :if => lambda { |feedback| feedback.email.blank? }
             validates :message, :presence => true

    end
  end
end
