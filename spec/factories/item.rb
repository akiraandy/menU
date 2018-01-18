require 'faker'

FactoryBot.define do
    factory :item do
        name Faker::Lorem.word
        description "They're yummy"
        price "2.00"
        DotW 0
        daily_special_status false
        active_status true
    end
end