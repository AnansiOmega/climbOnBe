class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :fname, :lname, :age, :gender, :climbing_preference, :commitment, :skill_level, :bio, :photo, :user_and_friend_posts
  has_many :notifications
  has_many :friends

  def user_and_friend_posts
    object.user_and_friend_posts
  end

  include Rails.application.routes.url_helpers
  
  def photo
      rails_blob_path(object.photo, only_path: true) if object.photo.attached?
  end
end
