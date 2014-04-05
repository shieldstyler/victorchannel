namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         email: "example@railstutorial.org",
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: true)
    User.create!(name: "Example User",
                 email: "notexample@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.comments.create!(content: content, article_id: 1) }
    end
    Author.create!(name: "Example Author")
    Article.create!(author_id: 1, title: "TestArticle1", published: Date.today, edited: Date.tomorrow)
    Article.create!(author_id: 1, title: "TestArticle2", published: Date.today, edited: Date.tomorrow)
  end
end