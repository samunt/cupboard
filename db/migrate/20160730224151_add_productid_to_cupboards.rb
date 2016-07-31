class AddProductidToCupboards < ActiveRecord::Migration
  def change
    add_column :cupboards, :product_id, :integer
  end
end
