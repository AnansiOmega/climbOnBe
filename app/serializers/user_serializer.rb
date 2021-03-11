class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :fname, :lname, :age, :gender, :climbing_preference, :commitment, :skill_level, :bio, :photo, :background_image
  has_many :notifications
  has_many :friends

  include Rails.application.routes.url_helpers
  
  def photo
      rails_blob_path(object.photo, only_path: true) if object.photo.attached?
  end

  def background_image
      rails_blob_path(object.background_image, only_path: true) if object.background_image.attached?
  end
end
