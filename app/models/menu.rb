class Menu < ApplicationRecord
    has_many :menu_menu_items
    has_many :menu_items, through: :menu_menu_items
    has_many :items, through: :menu_items
    has_many :categories, through: :menu_items
    
    def unique_categories
        self.categories.uniq
    end
end
