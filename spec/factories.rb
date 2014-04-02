FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
  factory :author do
    name "TestAuthor"
  end
  factory :article do
    author_id 1
    title "TestArticle1"
    #sequence(:title)  { |n| "Titlee #{n}" }
    published Date.yesterday
    edited Date.today
  end
  factory :comment do
    content "Lorem ipsum"
    article_id 1
    user_id 1
  end
end