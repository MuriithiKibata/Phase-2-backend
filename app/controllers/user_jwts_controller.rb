class UserJwtsController < ApplicationController
    skip_before_action :authorize, only: [:create]

    def create
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            token = encode_token({user_id: user.id})
            render json: [UserSerializer.new(user), {jwt: token}], status: :created
        else
            render json: {errors: "Password or email is incorrect"}, status: :unauthorized
    end
  end
end
