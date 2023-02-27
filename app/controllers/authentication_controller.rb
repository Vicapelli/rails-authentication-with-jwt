class AuthenticationController < ApplicationController
  skip_before_action :authenticate_user

  def login
    user = User.find_by!(email: params[:email]) if params[:email].present?
    user = User.find_by!(username: params[:username]) if user.nil?

    if user.authenticate(params[:password])
      token = jwt_encode({ id: user.id, user_name: user.username })
      # FlightMailer.with(user: user).send_flight.deliver
      render json: { user: user, token: token }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
end