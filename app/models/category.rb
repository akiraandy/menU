class Category < ApplicationRecord
    has_many :menu_items
    has_many :items, through: :menu_items, dependent: :destroy

    validates_presence_of :name
    validates_uniqueness_of :name
end
