class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  # protect_from_forgery with: :exception
  before_action :set_order
  before_action :set_menus

  def days
    @days = (%w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday).to_a).to_a.zip(0..6)
  end

  private

  def set_order
    @order = Order.find(session[:order_id])
  rescue ActiveRecord::RecordNotFound
    @order = Order.create(user: current_user)
    session[:order_id] = @order.id
  end

  def set_menus
    @menus = Menu.all
  end


  
end
