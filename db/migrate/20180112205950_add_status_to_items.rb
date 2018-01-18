class AddStatusToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :active_status, :boolean, default: true
  end
end
