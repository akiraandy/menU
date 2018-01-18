class Item < ApplicationRecord
  has_many :menu_items
  has_many :menus, through: :menu_items

  validates_presence_of :name, :description, :price
  validates_uniqueness_of :name

  def set_active_status
    self.update(active_status: !active_status)
  end

  def disabled?
    daily_special_status && self.DotW != Date.today.wday
  end
end
