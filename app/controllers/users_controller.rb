class UsersController < ApplicationController
    skip_before_action :authorized

    def index
        @users = User.all
        render json: {users: UserSerializer.new(@users)}, status: :ok
    end

    def create 
        @user = User.create(user_params) 
        if @user.valid?
            render json: {login: true}, status: :created
        else
            render json: {message: "You fucked up."}, status: :not_acceptable
        end
    end    
   
    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
