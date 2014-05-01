FactoryGirl.define do
  factory :user do
    @first_name = Faker::Name.first_name
    sequence(:username, @first_name) { |n| "#{@first_name}_#{n}"}
    sequence(:email, @first_name) { |n| "#{@first_name}_#{n}@example.com"}
    after(:build) { |u| u.password = u.password_confirmation = '123456789'}
  end
end