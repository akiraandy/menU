class OrderItemsController < ApplicationController
  def create
    @order.add_item(order_item_params)

    if @order.save!
    else
      redirect_to items_path, alert: "There was a problem adding this item to your cart."
    end
  end

  def destroy
    @order.delete_item(params)
    
    if @order.save
    else
      redirect_to items_path, alert: "There was a problem deleting this item from your order."
    end
  end

  def update
    @order.update_item(order_item_params)

    if @order.save
    else
      redirect_to items_path, alert: "There was a problem updating your order."
    end

  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :id, :unit_price, :menu_item_id)
  end
end
