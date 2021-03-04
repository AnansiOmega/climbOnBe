module ApplicationCable
  class Connection < ActionCable::Connection::Base
    def connect
      self.current_user = find_verified_user
    end

    private


    def find_verified_user
      if verified_user = User.find_by(id: params[:user_id])
        verified_user
      else
        return
    end
  end
end
