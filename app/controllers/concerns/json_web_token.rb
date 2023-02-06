module JsonWebToken
    extend ActiveSupport::Concern
    SECRET_KEY = ENV["SECRET_KEY_BASE"]

    def jwt_encode(payload, exp = 12.hours.from_now)
        payload[:exp] = exp.to_i
        JWT.encode payload, SECRET_KEY, 'HS256'
    end

    def jwt_decode(token)
        decoded = JWT.decode(token, SECRET_KEY)[0]
        HashWithIndifferentAccess.new decoded
    end
end