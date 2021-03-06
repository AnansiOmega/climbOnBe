class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def create
        user = User.create(user_params)
        if user.valid?
            render json: user, include: '*.*'
        else
            render json: { errors: user.errors.full_messages }
        end
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: user
    end

    def find_climbers
        users = User.find_partners(find_params)
        render json: users
    end

    def friend_requests
        user = User.find(params[:id])
        render json: user.received_requests
    end

    


    private

    def user_params
        params.permit(:username, :password, :fname, :lname, :age, :gender, :climbing_preference.downcase, :commitment, :skill_level, :bio, :street, :city, :state, :photo, :background_image)
    end

    def find_params
        params.permit(:gender, :climbing_preference, :commitment, :skill_level, :gender, :distance, :id)
    end

    def connect_params
        params.permit(:root_user_id, :id)
    end
end
