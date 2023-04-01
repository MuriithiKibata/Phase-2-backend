class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_response
    skip_before_action :authorize, only: [:create]
    def index
        render json: User.all
    end

    def show 
        user = User.find(params[:id])
        render json: user
    end

    def profile 
        render json: @user
    end

    def create
        user  = User.create!(user_params)
        token = encode_token({user_id: user.id})
        render json: [UserSerializer.new(user), {token: token}], status: :created
    end

    private

    def user_params
        params.permit(:email, :password, :password_confirmation)
    end

    def invalid_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end
