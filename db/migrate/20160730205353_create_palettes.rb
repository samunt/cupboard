class CreatePalettes < ActiveRecord::Migration
  def change
    create_table :palettes do |t|

      t.timestamps null: false
    end
  end
end
