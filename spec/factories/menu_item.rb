require 'faker'

FactoryBot.define do
    factory :menu_item do
        association :item
        association :category
    end
end