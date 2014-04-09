namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         email: "example@railstutorial.org",
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: true)
    User.create!(name: "Test User",
                 email: "test@test.com",
                 password: "testtest",
                 password_confirmation: "testtest")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    users = User.all(limit: 4)
    5.times do
      content = Faker::Lorem.sentence(3)
      users.each { |user| user.comments.create!(content: content, article_id: 1) }
    end
    Author.create!(name: "Tyler Shields")
    Author.create!(name: "Test Author")
    #Article.create!(author_id: 1, title: "TestArticle1", published: Date.today, edited: Date.tomorrow)
    #Article.create!(author_id: 1, title: "TestArticle2", published: Date.today, edited: Date.tomorrow)
    Article.create!(title: "Review: Assassin's Creed IV: Black Flag", shortname: "ac4review", author_id: 1, published: Date.yesterday, edited: Date.today)
    12.times do |n|
      title  = "Test Article #{n+1}"
      shortname  = "article#{n+1}"
      Article.create!(title: title, shortname: shortname, author_id: 1, published: Date.yesterday, edited: Date.today)
    end
  end
end