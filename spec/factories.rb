FactoryGirl.define do
  
  factory :user do
    sequence(:email){|n| "user_#{n}@example.com"}
    password 'password'
    password_confirmation 'password'
    sequence(:name){|n| "User #{n}"}
  end

end