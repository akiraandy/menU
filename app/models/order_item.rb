class OrderItem < ApplicationRecord
  belongs_to :menu_item
  belongs_to :order

  before_save :finalize

  validates_presence_of :quantity
  validates_numericality_of :quantity, { only_integer: true, greater_than: 0 }

  def finalize
    self.total_price = quantity * unit_price
  end
end
