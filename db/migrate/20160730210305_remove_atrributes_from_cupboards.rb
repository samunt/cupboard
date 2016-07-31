class RemoveAtrributesFromCupboards < ActiveRecord::Migration
  def change
    remove_column :cupboards, :colors
    remove_column :cupboards, :accent
    remove_column :cupboards, :top
    remove_column :cupboards, :bottom
    remove_column :cupboards, :outer
  end
end
