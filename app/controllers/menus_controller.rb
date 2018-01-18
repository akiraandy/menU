class MenusController < ApplicationController
    before_action :days

    def show
        @menu = Menu.find(params[:id])
        @categories = @menu.unique_categories.sort
        @order_item = OrderItem.new
    end

    def index
        @menus = Menu.all
    end
end