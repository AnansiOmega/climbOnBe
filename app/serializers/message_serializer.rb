class MessageSerializer < ActiveModel::Serializer
  attributes :id, :body, :fname

  def fname
    User.find(object.user_id).fname
  end

end
