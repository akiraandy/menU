class AddCategoryToMenuItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :menu_items, :category, foreign_key: true
  end
end
