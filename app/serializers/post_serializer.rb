class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :user
  has_one :user
  has_many :comments
end
