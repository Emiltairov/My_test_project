class Modifyfeedmodel < ActiveRecord::Migration
def change
    add_column :refinery_feedbacks, :question, :string
  end
end
