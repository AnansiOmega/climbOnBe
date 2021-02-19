class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :fname, :lname, :age, :gender, :climbing_preference, :commitment, :skill_level, :bio, :street, :city, :state, :photo, :password



  include Rails.application.routes.url_helpers
  
  def photo
      rails_blob_path(object.photo, only_path: true) if object.photo.attached?
  end
end
