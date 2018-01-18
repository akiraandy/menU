class RemoveMenuIdFromMenuItem < ActiveRecord::Migration[5.1]
  def change
    remove_column :menu_items, :menu_id
  end
end
