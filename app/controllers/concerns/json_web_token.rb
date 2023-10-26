require "jwt"

module JsonWebToken

    extend ActiveSupport::Concern

    SECRET_KEY = Rails.application.secrets.secret_key_base

    def jwt_encode(payload, exp = 7.days.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, SECRET_KEY)
    end

    def jwt_decode(token)
        if token
            begin
                decoded = JWT.decode(token, SECRET_KEY)[0]
                HashWithIndifferentAccess.new decoded
            rescue JWT::VerificationError, JWT::DecodeError
                decoded = "Token not found"
            end
        else
            decoded = "Token not found"
        end
    end

    def jwt_decode_google(token)
        begin
            decoded = JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')
        rescue JWT::DecodeError => e
            decoded = "Token not found"
        end
      end

end