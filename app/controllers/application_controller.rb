class ApplicationController < ActionController::API
    include JsonWebToken
    before_action :authenticate_user
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    private

    def authenticate_user
        header = request.headers["Authorization"]
        header = header.split(' ').last if header
        begin
            decoded = jwt_decode(header)
        rescue JWT::ExpiredSignature
            render json: { errors: "token expired" }, status: 477 and return
        rescue JWT::DecodeError
            render json: { errors: "invalid_token" }, status: :unauthorized and return
        end
        @current_user = User.find(decoded[:user_id])
    end

    def record_not_found
        render json: { error: "record_not_found" }, status: 404
    end
end
