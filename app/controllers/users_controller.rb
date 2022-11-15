class UsersController < ApplicationController
    def create
        user = User.new (
            username:user_params[:username]
        )
        if user.save
            render json: user, status:200
        else
            render json: {error:"error creating user"}
    end
    private
    def user_params
        params.require(:product).permit([:username])
    end
end
