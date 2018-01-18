FactoryBot.define do
    factory :order_item do
        quantity 1
        total_price 10.00
        unit_price 1.00
        association :order
        association :menu_item
    end
end