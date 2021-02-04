class AdminsController < ApplicationController
    
    def index
        @admins = Admin.all
        render json: @admins
    end

    def create
        @admin = Admin.create(admin_params)
        if @admin.save
            auth_token = Knock::AuthToken.new payload: {sub:@admin.id}
            render json: {username: @admin.username, jwt: auth_token.token}, status: :created
        else
            render json: @admin.errors, status: :unprocessable_entity
        end
    end

    def sign_in
        @admin = Admin.find_by_email(params[:email])
        if @admin && @admin.authenticate(params[:password])
            auth_token = Knock::AuthToken.new payload: {sub:@admin.id}
            render json: {username: @admin.username, jwt: auth_token.token}, status: 200
        else
            render json: {error: "incorrect email or password"}, status: 404
        end
    end

    private
    def admin_params
        params.permit(:admin, :username, :email, :password, :password_confirmation)
    end
end
