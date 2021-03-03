class FriendshipSerializer < ActiveModel::Serializer
  attributes :id
  has_one :sent_to
  has_one :sent_by
end
