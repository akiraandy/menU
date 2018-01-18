class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :get_order, only: [:new, :update]
    
    def index
        @orders = current_user.completed_orders
    end

    def review
        if get_order.order_items.empty?
            redirect_to items_path
        end
    end

    def new
    end

    def update
        @order.update(status: true)
        session[:order_id] = nil
        redirect_to user_orders_path(current_user)
    end

    private

    def get_order
        @order = Order.find(session[:order_id])
    end
end