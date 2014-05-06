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
        @feedback = Feedback.new(params[:feedback])
        
        respond_to do |format|
          if @feedback.save
            format.html { redirect_to '/feedbacks', notice: 'Feedback was successfully created.' }
            format.json { render json: @feedback, status: :created, location: @feedback }
#=>         FeedbackMailer.notification(@feedback, request).deliver
          else
            format.html { render action: "new" }
            format.json { render json: @feedback.errors, status: :unprocessable_entity }
          end
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
