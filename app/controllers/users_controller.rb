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

    def find
        users = User.find_partners(params[:climbing_preference].downcase, params[:commitment].downcase, params[:skill_level].downcase, params[:gender].downcase)
        render json: users
    end



    private

    def user_params
        params.permit(:username, :password, :fname, :lname, :age, :gender, :climbing_preference, :commitment, :skill_level, :bio, :street, :city, :state, :photo)
    end
end
