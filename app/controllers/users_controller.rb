class UsersController < ApplicationController
    skip_before_action :authorize, only: [:create]
    def index
        render json: User.all
    end

    def create
        user  = User.create(user_params)
        token = encode_token({user_id: user.id})
        render json: [UserSerializer.new(user), {token: token}], status: :created
    end

    private

    def user_params
        params.permit(:email, :password, :password_confirmation)
    end
end
