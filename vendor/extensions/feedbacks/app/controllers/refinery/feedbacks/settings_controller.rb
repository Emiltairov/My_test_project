module Refinery
  module Feedbacks
    class SettingsController < ::ApplicationController

      before_filter :find_all_settings
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @setting in the line below:
        present(@page)
      end

      def show
        @setting = Setting.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @setting in the line below:
        present(@page)
      end

    protected

      def find_all_settings
        @settings = Setting.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/settings").first
      end

    end
  end
end
