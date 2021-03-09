class LikeSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :post
  has_one :comment
end
