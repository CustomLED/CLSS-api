class PostsController < ApplicationController
    before_action :set_post, only: [:show, :update, :destroy]

    def index
        @posts = Post.all
        render json: @posts
    end

    def create
        # render json: params
        @post = Post.create(post_params)
        if @post.errors.any?
            render json: @post.errors, status: :unprocessable_entity
        else
            render json: @post, status: 201
        end
        # entry = post.create(post_params)
        # render json: entry
    end

    def show
        render json: @post
    end

    def update
        @post.update(post_params)
        render json: @post
    end

    def destroy
        @post.destroy
        render json: 204
    end

    private
    def post_params
        return params.require(:post).permit(:name, :text, :admin_id,)
    end

    def set_post
    #     @post= Post.find(params[:id])
    # end
        begin
            @post = Post.find(params[:id])
        rescue 
            render json: {error: "post not found"}, status: 404
        end
    end
end
