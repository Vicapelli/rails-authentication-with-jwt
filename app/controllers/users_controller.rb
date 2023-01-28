class UsersController < ApplicationController
    skip_before_action :authenticate_user, only: [:create]

    def create
        user = User.new(user_params)
        if user.save
            render json: { user: user }, status: 200 
        else
            render json: { errors: user.errors.full_messages }, status: 422
        end
    end

    def update
    end

    def show
        users = User.all
        render json: users
    end
    private

    def user_params
        params.permit(:username, :email, :password)
    end
end
