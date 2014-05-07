FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "person_#{n}"}
    sequence(:email) { |n| "person_#{n}@example.com"}
    after(:build) { |u| u.password = u.password_confirmation = '123456789'}
  end
  factory :confirmed_user, parent: :user do
    after(:create) { |user| user.confirm! }
  end
end