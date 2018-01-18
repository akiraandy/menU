class CreateMenuMenuItems < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_menu_items do |t|
      t.references :menu_item, foreign_key: true
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end
