class ApplicationController < ActionController::API
    before_action :authorize 
    def encode_token(payload)
        JWT.encode(payload, "t0rP3d0")
    end

    def auth_header
        request.headers["Authorization"]
    end

    def decode_auth_header
        if auth_header
            token = auth_header.split(" ")[1]
            begin
                JWT.decode(token, "t0rP3d0", true, algorithm: "HS256")
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        if decode_auth_header
            user_id = decode_auth_header[0]["user_id"]
            @user = User.find(user_id)
        end
    end

    def logged_in?
        !!current_user
    end

    def authorize
        render json: {message: "Please log in"}, status: :unauthorized unless logged_in?
    end

end
