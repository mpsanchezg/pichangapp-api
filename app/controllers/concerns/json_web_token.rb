require "jwt"
require 'base64'

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
            # Extract the payload part (the second segment) of the JWT.
            payload_base64 = id_token.split('.')[1]

            # Add padding if needed, as Base64 requires padding.
            payload_base64 += '=' * (4 - payload_base64.length % 4)

            # Decode the base64-encoded payload.
            decoded_payload = Base64.urlsafe_decode64(payload_base64)

            # Parse the JSON data in the payload.
            payload_data = JSON.parse(decoded_payload)

            # Access user information from the payload.
            user_email = payload_data['email']
            user_name = payload_data['name']
            user_picture = payload_data['picture']
            

            decoded = payload_data
        rescue JWT::VerificationError, JWT::DecodeError
            decoded = "Token not found"
        end
      end

end