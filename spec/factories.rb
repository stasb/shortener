require 'factory_girl'

FactoryGirl.define do
  factory :link do
    sequence(:store) { |n| "Something#{n}.com" }
  end
end
