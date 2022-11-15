class ApplicationsController < ApplicationController
    def create
        application = Application.new (
            name:app_params[:name]
            chat_no:app_params[:chat_no]
            msg_no:app_params[:msg_no]
            user_id:app_params[:user_id]
        )
        if app.save
            render json: user, status:200
        else
            render json: {error:"error creating user"}
    end
    private
    def app_params
        params.require(:product).permit([
            :token,
            :name,
            :chat_no,
            :msg_no,
            :user_id,
        ])
    end
end
