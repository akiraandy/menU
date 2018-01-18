class AddDailySpecialStatusToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :daily_special_status, :boolean, default: false
  end
end
