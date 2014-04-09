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
    Author.create!(name: "Tyler Shields")
    Article.create!(author_id: 1, title: "Review: Assassin's Creed IV: Black Flag", published: Date.today, edited: Date.tomorrow, shortname: "ac4review")
    6.times do |n|
      author = 1
      title = "Test Article #{n+1}"
      shortname = "testarticle#{n+1}"
      Article.create!(author_id: author, title: title, published: Date.today, edited: Date.tomorrow, shortname: shortname)
    end
  end
end