require 'spec_helper'

module Refinery
  module Feedbacks
    describe Feedback do
      describe "validations" do
        subject do
          FactoryGirl.create(:feedback,
          :email => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:email) { should == "Refinery CMS" }
      end
    end
  end
end
