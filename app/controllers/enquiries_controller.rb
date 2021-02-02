class EnquiriesController < ApplicationController
    before_action :set_enquiry, only: [:show, :update, :destroy]

    def index
        @enquiry = Enquiry.all
        render json: @enquiry
    end

    def create
        # render json: params
        @enquiry = Enquiry.create(enquiry_params)
        if @enquiry.errors.any?
            render json: @enquiry.errors, status: :unprocessable_entity
        else
            render json: @enquiry, status: 201
        end
        # entry = post.create(post_params)
        # render json: entry
        #gay
    end

    def show
        render json: @enquiry
    end

    def update
        @enquiry.update(enquiry_params)
        render json: @post
    end

    def destroy
        @enquiry.destroy
        render json: 204
    end

    private
    def enquiry_params
        return params.require(:enquiry).permit(:first_name, :last_name, :organisation, :email, :phone_number, :description, :admin_id,)
    end

    def set_enquiry
    #     @post= Post.find(params[:id])
    # end
        begin
            @enquiry = Enquiry.find(params[:id])
        rescue 
            render json: {error: "enquiry not found"}, status: 404
        end
    end

end
