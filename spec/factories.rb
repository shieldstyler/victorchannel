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
  factory :comment do
    sequence(:content) { |n| "Lorem ipsum"}
    article_id 1
    user
  end
  factory :author do
    sequence(:name)  { |n| "Authorr #{n}" }
  end
  factory :article do
    author
    title "TestArticle1"
    #sequence(:title)  { |n| "Titlee #{n}" }
    published Date.yesterday
    edited Date.today
  end
end