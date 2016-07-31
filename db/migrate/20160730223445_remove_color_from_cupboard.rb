class RemoveColorFromCupboard < ActiveRecord::Migration
  def change
    remove_column :cupboards, :color 
  end
end
