require 'spec_helper'

module Refinery
  module Feedbacks
    describe Setting do
      describe "validations" do
        subject do
          FactoryGirl.create(:setting,
          :mail_adm => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:mail_adm) { should == "Refinery CMS" }
      end
    end
  end
end
