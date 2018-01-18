class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items


  after_initialize :set_default_values
  before_save :calculate_total

  def add_item(item_params)

    current_item = order_items.find_by(menu_item: item_params[:menu_item_id])

    if current_item
      current_item.quantity += item_params[:quantity].to_i
      current_item.save
    else
      new_item = order_items.create!(menu_item_id: item_params[:menu_item_id], quantity: item_params[:quantity].to_i, order: self, unit_price: item_params[:unit_price])
    end
  end

  def update_item(item_params)

    current_item = order_items.find_by(id: item_params[:id])

    current_item.quantity = item_params[:quantity].to_i

    if current_item.quantity > 0
      current_item.save
    else
      delete_item(item_params)
    end
  end

  def delete_item(params)
    current_item = order_items.find_by(id: params[:id])
    current_item.destroy
  end

  def self.update_item_statuses(menu_item)
    active_orders = self.all.where(status: false)
    active_orders.each do |active_order|
      order_item = active_order.order_items.find_by(menu_item_id: menu_item.id)
      if order_item
        order_item.destroy
      end
    end
  end

  private 

  def set_default_values
    self.status = self.status || false
    self.total = self.total || 0.0
  end

  def calculate_total
    self.total = order_items.sum(:total_price)
  end

end
