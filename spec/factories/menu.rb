require 'faker'

FactoryBot.define do
    factory :menu do
        name Faker::Lorem.word
    end
end