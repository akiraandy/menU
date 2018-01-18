require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
    before(:each) do 
      sign_in create(:user, email: "yo@gmail.com")      
      @item = create(:item)
      @category = create(:category)
      @menu = create(:menu)
      @menu_item = build(:menu_item, category: @category, item: @item)
      @menu_item.menus << @menu
      @menu_item.save
      @user = create(:user)
    end
  describe "POST #create" do

    it "returns http success" do
      post :create, params: { order_item: { quantity: '1', menu_item_id: @menu_item.id, unit_price: '1' }, menu_item_id: @menu_item.id}, xhr: true
      expect(response).to have_http_status :success
    end

    it "creates a new order_item" do
      post :create, params: { order_item: { quantity: '1', menu_item_id: @menu_item.id, unit_price: '1' }, menu_item_id: @menu_item.id}, xhr: true
      expect(OrderItem.all.length).to eq 1
    end
  end

  describe "PATCH #update" do
    before {post :create, params: { order_item: { quantity: '1', menu_item_id: @menu_item.id, unit_price: '1' }, menu_item_id: @menu_item.id}, xhr: true}

    it "returns http success" do
      patch :update, params: { order_item: { quantity: '1', id: Order.all.first.order_items.first.id, unit_price: '1' }, id: Order.all.first.order_items.first.id}, xhr: true
      expect(response).to have_http_status :success
    end

    it "updates an order_item" do
      patch :update, params: { order_item: { quantity: '2', id: Order.all.first.order_items.first.id, unit_price: '1' }, id: Order.all.first.order_items.first.id}, xhr: true
      expect(OrderItem.all.first.quantity).to eq 2
    end
  end

  describe "DELETE #destroy" do

    before {post :create, params: { order_item: { quantity: '1', menu_item_id: @menu_item.id, unit_price: '1' }, menu_item_id: @menu_item.id}, xhr: true}

    it "returns http success" do
      delete :destroy, params: {id: Order.all.first.order_items.first.id}, xhr: true
      expect(response).to have_http_status :success
    end

    it "deletes an order_item" do
      delete :destroy, params: {id: Order.all.first.order_items.first.id}, xhr: true
      expect(OrderItem.all.length).to eq 0
    end
  end
end
