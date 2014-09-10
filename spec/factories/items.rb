FactoryGirl.define do
  factory :item do
    list
    item {Faker::Commerce.product_name}
  end
end