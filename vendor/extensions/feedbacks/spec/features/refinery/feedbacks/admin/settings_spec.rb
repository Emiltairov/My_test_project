# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Feedbacks" do
    describe "Admin" do
      describe "settings" do
        refinery_login_with :refinery_user

        describe "settings list" do
          before do
            FactoryGirl.create(:setting, :mail_adm => "UniqueTitleOne")
            FactoryGirl.create(:setting, :mail_adm => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.feedbacks_admin_settings_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.feedbacks_admin_settings_path

            click_link "Add New Setting"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Mail Adm", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Feedbacks::Setting.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Mail Adm can't be blank")
              Refinery::Feedbacks::Setting.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:setting, :mail_adm => "UniqueTitle") }

            it "should fail" do
              visit refinery.feedbacks_admin_settings_path

              click_link "Add New Setting"

              fill_in "Mail Adm", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Feedbacks::Setting.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:setting, :mail_adm => "A mail_adm") }

          it "should succeed" do
            visit refinery.feedbacks_admin_settings_path

            within ".actions" do
              click_link "Edit this setting"
            end

            fill_in "Mail Adm", :with => "A different mail_adm"
            click_button "Save"

            page.should have_content("'A different mail_adm' was successfully updated.")
            page.should have_no_content("A mail_adm")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:setting, :mail_adm => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.feedbacks_admin_settings_path

            click_link "Remove this setting forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Feedbacks::Setting.count.should == 0
          end
        end

      end
    end
  end
end
