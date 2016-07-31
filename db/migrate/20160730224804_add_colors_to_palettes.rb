class AddColorsToPalettes < ActiveRecord::Migration
  def change
    add_column :palettes, :color_id, :integer
  end
end
