# This migration comes from refinery_feedbacks (originally 3)
class CreateFeedbacksSettings < ActiveRecord::Migration

  def up
    create_table :refinery_feedbacks_settings do |t|
      t.string :mail_adm
      t.string :question
      t.string :mail_otd
      t.string :conf_mail
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-feedbacks"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/feedbacks/settings"})
    end

    drop_table :refinery_feedbacks_settings

  end

end
