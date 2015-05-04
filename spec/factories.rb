FactoryGirl.define do
  
  factory :user do
    sequence(:email){|n| "user_#{n}@example.com"}
    password 'password'
    password_confirmation 'password'
    sequence(:name){|n| "User #{n}"}
  end

  factory :article do
    sequence(:title){|n| "Title #{n}"}
    snippets { [build(:text_snippet)] }
    author { create(:user).id }

    trait(:published){ published true; published_at DateTime.yesterday }
    trait(:planned){ published true; published_at DateTime.tomorrow }
    trait(:expired){ published true; published_at DateTime.yesterday; expires_at DateTime.yesterday }
    trait(:draft){ published false }
    trait(:not_published){ published false }

    factory(:invalid_article) do
      title nil
    end
  end

  factory :tag do
    sequence(:_id){|n| "tag_#{n}"}
    value { rand(1..10) }
  end

  factory :text_snippet, class: 'Snippets::Text' do
    sequence(:body){ |n| "## Post #{n}" }
  end

  factory :embed_snippet, class: 'Snippets::Embed' do
    body { "<iframe src='#'></iframe>" }
  end

end