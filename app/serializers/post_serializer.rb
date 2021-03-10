class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :user, :time_posted
  has_one :user
  has_many :likes

  def time_posted
    object.created_at.strftime("%B %d, %y")
  end
end
