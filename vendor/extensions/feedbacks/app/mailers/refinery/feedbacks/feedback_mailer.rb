module Refinery
  module Feedbacks
    class FeedbackMailer < ActionMailer::Base
      def notification(feedback)
        @feedback = feedback
         mail :subject  => 'You have received a new feedback',
              :to       => 'admin@rambler.ru',
              :from     => '<no-reply@#{request.domain}>'
      end

    end
  end
end
