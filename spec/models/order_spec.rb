require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to :user }
  it { should have_many :order_items }
  let(:user) { create(:user) }
  let(:menu) { create(:menu) }
  let(:category) { create(:category)}
  let(:item) { create(:item)}
  let!(:menu_item) { build(:menu_item, item: item, category: category) }

  context "add_item" do

    before(:each) do
      menu_item.menus << menu
      menu_item.save
    end

    let(:order) { create(:order, user: user) }
    let(:item_params) { {menu_item_id: menu_item.id, quantity: 1, quantity: 1, order: order, unit_price: 1 } }
    
    it "should create a new order_item" do
      order.add_item(item_params)
      expect(order.order_items.length).to eq 1
    end

    it "should add to current quantity if adding to an existing item" do
      order.add_item(item_params)
      order.add_item(item_params)
      expect(order.order_items.first.quantity).to eq 2
    end
  end

  context "update_item" do

    before(:each) do
      menu_item.menus << menu
      menu_item.save
      @order = create(:order, user: user)
      @order_item =  create(:order_item, order: @order, menu_item: menu_item)
      @order.order_items << @order_item
      @order.save
    end

    it "should update quantity of order item" do
      @item_params = {id: @order_item.id, quantity: 3, order: @order, unit_price: 1 }
      @order.update_item(@item_params)
      expect(@order.order_items.first.quantity).to eq 3
    end

    it "should delete item if quantity is 0 or less" do  
      @item_params = {id: @order_item.id, quantity: 0, order: @order, unit_price: 1 }      
      expect{@order.update_item(@item_params)}.to change{OrderItem.all.length}.from(1).to(0)
    end
  end

  context "delete_item" do

    before(:each) do
      menu_item.menus << menu
      menu_item.save
      @order = create(:order, user: user)
      @order_item =  create(:order_item, order: @order, menu_item: menu_item)
      @order.order_items << @order_item
      @order.save
      @params = {id: @order_item.id }
    end

    it "should delete order item from order" do
      expect{@order.delete_item(@params)}.to change{OrderItem.all.length}.from(1).to(0)
    end
  end
end
