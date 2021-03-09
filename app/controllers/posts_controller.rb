class PostsController < ApplicationController

    def create
        post = Post.create(post_params)
        render json: post
    end

    def show
        post = Post.find(params[:id])
        render json: post, include: '*.*'
    end




    private

    def post_params
        params.permit(:user_id, :content)
    end
end
