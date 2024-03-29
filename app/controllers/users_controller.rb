class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]

  def index
    users = Rails.cache.fetch('users_list') do
      User.all.exclude_passwords.pluck(:id, :username, :email)
    end

    render json: users
  end

  def create
    user = User.new(user_params)
    if user.save
      # Publisher::Sender.publish
      render json: { user: user }, status: 200
    else
      render json: { errors: user.errors.full_messages }, status: 422
    end
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end
end
