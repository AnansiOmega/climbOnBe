class PostsController < ApplicationController

    def user_and_friends_posts
        user = User.find(params[:id])
        posts = user.user_and_friend_posts
        render json: posts, include: '*.*'
    end 

    def users_posts
        render json: Post.where( user_id: params[:id]), include: '*.*'
    end

    def create
        post = Post.create(post_params)
        render json: post
    end

    private

    def post_params
        params.permit(:user_id, :content)
    end
end
