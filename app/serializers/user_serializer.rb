class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :fname, :lname, :age, :gender, :climbing_preference, :commitment, :skill_level, :bio, :street, :city, :state, :photo



  include Rails.application.routes.url_helpers
  
  def photo
      rails_blob_path(object.image, only_path: true) if object.photo.attached?
  end
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