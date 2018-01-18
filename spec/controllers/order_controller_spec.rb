require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
    before(:each) do 
      @user = create(:user, email: "yo@gmail.com") 
      @order = create(:order, user: @user)
      sign_in @user
    end
  describe "PATCH #update" do

    it "updates status of order" do
      patch :update, params: { user_id: @user.id, id: @order.id }
      expect(Order.all.last.status).to equal true
    end
  end

end