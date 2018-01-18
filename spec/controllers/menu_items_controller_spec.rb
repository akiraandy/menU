require 'rails_helper'

RSpec.describe MenuItemsController, type: :controller do
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

    it "redirects upon success" do
      post :create, params: { menu_item: { menus: ["", @menu.id], category: @category.id, item_attributes: { daily_special_status: "1", DotW: "2", name: "testing", description: "testing", price: "5.0" } } }
      expect(response).to have_http_status :redirect
    end

    it "creates a new menu_item" do
      post :create, params: { menu_item: { menus: ["", @menu.id], category: @category.id, item_attributes: { daily_special_status: "1", DotW: "2", name: "testing", description: "testing", price: "5.0" } } }
      expect(MenuItem.all.length).to eq 2
    end
  end

  describe "PATCH #update" do

    before { patch :update, params: { menu_item: { menus: ["", @menu.id], category: @category.id, item_attributes: { daily_special_status: "1", DotW: "2", name: "updated item", description: "testing", price: "5.0", id: @item.id } }, id: @menu_item.id } }
    it "redirects upon success" do
      expect(response).to have_http_status :redirect
    end

    it "updates a menu_item" do
      expect(MenuItem.all.first.name).to eq "updated item"
    end
  end

  describe "DELETE #destroy" do
    
    before { delete :destroy, params: { id: @menu_item.id } }

    it "redirects upon success" do
      expect(response).to have_http_status :redirect
    end

    it "deletes a menu_item" do
      expect(MenuItem.all.length).to eq 1
    end
  end
end
