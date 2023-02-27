class FlightMailer < ApplicationMailer
  def send_flight
    @user = params[:user]
    mail(to: @user [:email], subject: 'Your flight')
  end
end
