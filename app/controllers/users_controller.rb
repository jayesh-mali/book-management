class UsersController < ApplicationController
    skip_before_action :authenticate_request

    def create
        user = User.new(create_params)
        if user.save
            render :json => {message: "You have successfully created your account."}, status: :ok
        else
            render :json => {error: user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private

    def create_params
      params.permit(:name, :email, :password)
    end
end
