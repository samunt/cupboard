class AddCupboardidToProducts < ActiveRecord::Migration
  def change
    add_column :products, :cupboard_id, :integer
  end
end
