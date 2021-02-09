class PostsController < ApplicationController
    before_action :set_post, only: [:show, :update, :destroy]

    def index
        @posts = Post.all
        render json: @posts
    end

    def create
        @post = Post.new()
        @post.admin_id = params["admin_id"] 
        @post.name = params["name"]
        @post.text = params["text"]
        @post.image.attach(params["file"])
        @post.url = @post.image.service_url
        @post.save()

        if @post.errors.any?
            render json: @post.errors, status: :unprocessable_entity
        else
            render json: @post, status: 201
        end
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

    def test
        puts params
        @post = Post.new()
        @post.admin_id = 1
        @post.image.attach(params["file"])
        @post.save()

    end

    private
    def post_params
        return params.require(:post).permit(:name, :text, :admin_id, :file)
    end

    def set_post

        begin
            @post = Post.find(params[:id])
        rescue 
            render json: {error: "post not found"}, status: 404
        end
    end
end
