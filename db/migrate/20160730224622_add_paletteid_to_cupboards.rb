class AddPaletteidToCupboards < ActiveRecord::Migration
  def change
    add_column :cupboards, :palette_id, :integer
  end
end
