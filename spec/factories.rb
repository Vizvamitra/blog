FactoryGirl.define do
  
  factory :user do
    sequence(:email){|n| "user_#{n}@example.com"}
    password 'password'
    password_confirmation 'password'
    sequence(:name){|n| "User #{n}"}
  end

  factory :post do
    sequence(:title){|n| "Title #{n}"}
    sequence(:body){|n| "## Post #{n}"}

    trait(:published){ published true; published_at DateTime.yesterday }
    trait(:planned){ published true; published_at DateTime.tomorrow }
    trait(:expired){ published true; published_at DateTime.yesterday; expires_at DateTime.yesterday }
    trait(:draft){ published false }
    trait(:not_published){ published false }

    factory(:invalid_post) do
      title nil
    end
  end

end