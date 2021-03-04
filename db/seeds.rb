# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# t.string "username"
# t.string "fname"
# t.string "lname"
# t.integer "age"
# t.string "sex"
# t.string "climbing_preference"
# t.integer "commitment"
# t.string "skill_level"
# t.text "bio"
# t.string "street"
# t.string "city"
# t.string "state"
puts 'destroy'
Notification.destroy_all
Message.destroy_all
Conversation.destroy_all
User.destroy_all
Friendship.destroy_all

genders = ['male', 'female', 'other']
preference = ['lead', 'top rope', 'boulder', 'trad']
skill = ['5.8', '5.9', '5.10', '5.11', '5.12', '5.13']

puts'rebuild'

i = 1

if i == 3
    i = 1
end

21.times do 
    User.create(
        username: Faker::FunnyName.name,
        password: '123',
        fname: Faker::Name.first_name,
        lname: Faker::Name.last_name,
        age: rand(18..70),
        gender: genders.sample,
        climbing_preference: preference.sample,
        commitment: rand(1..7),
        skill_level: skill.sample,
        bio: Faker::Quote.most_interesting_man_in_the_world,
        street: Faker::Address.street_name,
        city: Faker::Address.city,
        state: Faker::Address.state
    ).photo.attach(
        io: File.open("db/photos/#{i}.jpeg"),
        filename: "#{i}.jpeg",
        content_type: 'application/jpeg'
    )
end

puts 'just gotta make you'

User.create(
    username: 'Anansi',
    password: '123',
    fname: 'Ignas',
    lname: 'Butautas',
    age: 24,
    gender: 'male',
    climbing_preference: 'lead',
    commitment: 4,
    skill_level: '5.11',
    bio: 'hey ho lets go',
    street: '1904 Brighton St.',
    city: 'Downers Grove',
    state: 'IL'
).photo.attach(
    io: File.open("db/photos/1.jpeg"),
    filename: "1.jpeg",
    content_type: 'application/jpeg'
)

puts 'just gotta make you some friends'
# j = 0

# 12.times do
#     User.last.followers << User.all[j]
#     j += 1 
# end
puts 'all done'