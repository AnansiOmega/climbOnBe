class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def create
        user = User.create(user_params)
        render json: user
    end



    private

    def user_params
        params.permit(:username, :password, :fname, :lname, :age, :gender, :climbing_preference, :commitment, :skill_level, :bio, :street, :city, :state, :photo)
    end
end
