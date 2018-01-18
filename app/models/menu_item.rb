class MenuItem < ApplicationRecord
  belongs_to :item
  belongs_to :category
  has_many :menu_menu_items
  has_many :menus, through: :menu_menu_items
  accepts_nested_attributes_for :item
  accepts_nested_attributes_for :category
  validates :menus, length: { minimum: 1, message: "item must belong to at least 1 menu"}

  def name
    self.item.name
  end

  def active_status
    self.item.active_status
  end

  def dotw
    self.item.DotW
  end

  def daily_special_status
    self.item.daily_special_status
  end

  def description
    self.item.description
  end

  def price
    self.item.price
  end

  def update_item(category, menus)
    self.category = category
    self.menus = menus
  end
end
