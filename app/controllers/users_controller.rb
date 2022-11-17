class UsersController < ApplicationController
    def index
        users= User.all;
        render json: {status:'SUCCESS', messages:'loaded users',data:users}, status: :ok
    end
    def create
        user = User.new (user_params)
        if user.save
            render json: {status:'SUCCESS', messages:'create user',data:user}, status: :ok
            session[:user_id]=user.id
        else
            render json: {error:"this username is already taken"}
        end
    end

    def show 
        user=User.find(params[:id])
        if user.save
            session[:user_id]=user.id
            render json: {status:'SUCCESS', messages:'loaded user',data:user}, status: :ok
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: {status:'SUCCESS', messages:'delete user',data:user}, status: :ok
    end
    private
        def user_params
            params.require(:user).permit([:username])
        end
end
