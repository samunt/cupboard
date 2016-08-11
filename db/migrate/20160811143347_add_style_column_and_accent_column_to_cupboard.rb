class AddStyleColumnAndAccentColumnToCupboard < ActiveRecord::Migration
  def change
    add_column :cupboards, :style, :string
    add_column :cupboards, :season, :string
    add_column :cupboards, :neutral1, :string
    add_column :cupboards, :neutral2, :string
    add_column :cupboards, :accent1, :string
    add_column :cupboards, :accent2, :string
  end
end
