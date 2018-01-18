FactoryBot.define do
    factory :order do
        total 10.00
        status false
        association :user
    end
end