class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :fname, :lname, :age, :gender, :climbing_preference, :commitment, :skill_level, :bio, :street, :city, :state
end
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