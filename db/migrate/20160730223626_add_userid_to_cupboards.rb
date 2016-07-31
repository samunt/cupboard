class AddUseridToCupboards < ActiveRecord::Migration
  def change
    add_column :cupboards, :user_id, :integer
  end
end
