class ApplicationController < ActionController::API
    include JsonWebToken
    before_action :authenticate_user
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    private

    def authenticate_user
        header = request.headers["Authorization"]
        header = header.split(' ').last if header
        decoded = jwt_decode(header)
        @current_user = User.find(decoded[:user_id])
    end

    def record_not_found
        render json: { error: "record_not_found" }, status: 404
    end
end
