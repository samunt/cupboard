class AddPaletteidToColors < ActiveRecord::Migration
  def change
    add_column :colors, :palette_id, :integer
  end
end
