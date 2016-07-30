class CreateCupboards < ActiveRecord::Migration
  def change
    create_table :cupboards do |t|
      t.string :color
      t.string :accent
      t.string :top
      t.string :bottom
      t.string :outer

      t.timestamps null: false
    end
  end
end
