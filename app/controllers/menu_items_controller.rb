class MenuItemsController < ApplicationController
    before_action :days
    before_action :authenticate_user!
    
    def new
        @menu_item = MenuItem.new
        @menu_item.build_item     
    end

    def create
        menus = get_menus
        @item = Item.new(menu_item_params[:item_attributes])
        @menu_item = MenuItem.new(category: category_from_db)
        @menu_item.menus << menus
        @item.menu_items << @menu_item
        if @menu_item.save
            redirect_to menus_path
        else
            render :new
        end
    end

    def edit     
        @menu_item = MenuItem.find(params[:id])
        @menu_item 
    end

    def update
        @menu_item = MenuItem.find(params[:id])
        @item = @menu_item.item.assign_attributes(menu_item_params[:item_attributes])
        @menu_item.update_item(category_from_db, get_menus)
        if @menu_item.save
            redirect_to menus_path
        else
            render :edit
        end
    end

    def destroy
        @menu_item = MenuItem.find(params[:id])
        item = @menu_item.item
        item.set_active_status
        Order.update_item_statuses(@menu_item)
        redirect_to menus_path, alert: "Item successfully deleted!"
    end
    
    private

    def days
        @days = (%w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday).to_a).to_a.zip(0..6)
    end

    def menu_item_params
        params.require(:menu_item).permit(:category, :menus => [],
                                         item_attributes: 
                                         [
                                             :daily_special_status,
                                             :DotW,
                                             :name,
                                             :description,
                                             :price,
                                             :id
                                        ]
                                        )
    end

    def get_menus
        if menu_item_params[:menus]
            nums = menu_item_params[:menus].reject {|item| item.empty? }
            nums.map {|num| num.to_i}.map {|id| Menu.find(id)}
        end

    end

    def category_from_db
        category = Category.find(menu_item_params[:category].to_i)
    end

end