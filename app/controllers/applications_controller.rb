
class ApplicationsController < ApplicationController  
    def index
        applications= Application.all;
        render json: {status:'SUCCESS', messages:'loades article',data:applications}, status: :ok
    end
    def create
        application = Application.new(app_params)
        name_salt = BCrypt::Engine.generate_salt
        token_hash = BCrypt::Engine.hash_secret(app_params[:name],name_salt)
        application.token=token_hash
        #noofchat=Chats.find_by(application_id: application)
        application.user_id= params[:user_id]
        application.msg_no=1
        if application.save
            render json: {status:'SUCCESS', messages:'create application',data:application}, status: :ok
        else
            render json: {error:"same token"}
        end
    end
    def show 
        application=Application.find(params[:id])
        if application.save
            render json: {status:'SUCCESS', messages:'loaded application',data:application}, status: :ok
        else
            render json: {status:'SUCCESS', messages:'unfounded',data:application}, status: :ok
        end
    end

    def destroy
        application = Application.find(params[:id])
        application.destroy
        if application.save
            render json: {status:'SUCCESS', messages:'delete application',data:application}, status: :ok
        else
            render json: {status:'SUCCESS', messages:'unfounded',data:application}, status: :ok
        end
    end
    private
    def app_params
        params.require(:application).permit([:name])
    end
end
