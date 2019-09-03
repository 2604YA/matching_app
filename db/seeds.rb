User.create!(name:  "Example User",
                email: "example@railstutorial.org",
                password:              "foobar",
                password_confirmation: "foobar",
                admin: true,
                activated: true,
                activated_at: Time.zone.now,
                skill_want: "Programming",
                skill_want_level: 1,
                skill_want_description: "I wanna learn.",
                skill_teach: "Photohsop",
                skill_teach_level: 3,
                skill_teach_description: "I wanna teach.",)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now,
               skill_want: "Photohsop",
               skill_want_level: 1,
               skill_want_description: "I wanna learn.",
               skill_teach: "Programming",
               skill_teach_level: 3,
               skill_teach_description: "I wanna teach.",)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# リレーションシップ
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
