require "faker"
FactoryGirl.define do

  factory :ticket do |f|
    association :user, factory: :user
    f.title {Faker::Lorem.sentence}
    f.body {Faker::Lorem.paragraph}
    #f.user_id
  end

  factory :invalid_ticket, parent: :ticket do |f|
    f.title nil
  end

end