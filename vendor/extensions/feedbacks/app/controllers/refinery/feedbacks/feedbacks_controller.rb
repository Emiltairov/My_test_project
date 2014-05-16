module Refinery
  module Feedbacks
    class FeedbacksController < ::ApplicationController

      before_filter :find_all_feedbacks
      before_filter :find_page


      def index
        
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @feedback in the line below:
        present(@page)
      end
      
      def create
captcha_message = "The data you entered for the CAPTCHA wasn't correct.  Please try again"
    @feedback = Feedback.new(params[:feedback])
    if !verify_recaptcha(model: @feedback, message: captcha_message, :private_key => ENV['RECAPTCHA_PRIVATE_KEY']) || !@feedback.save
      render "new"
    end
   end
 
      def new 
        @feedback = Feedback.new
         present(@page)
      end



    protected


      def find_all_feedbacks
        @feedbacks = Feedback.order('position ASC')
      end


      def find_page
        @page = ::Refinery::Page.where(:link_url => "/feedbacks").first
      end


 

    end
  end
end
