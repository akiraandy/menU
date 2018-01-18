class AddMenuItemToOrderItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :order_items, :menu_item, foreign_key: true
  end
end
