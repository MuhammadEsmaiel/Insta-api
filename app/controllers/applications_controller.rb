
require 'digest'
class ApplicationsController < ApplicationController  
    def index
        applications= Application.all;
        render json: {status:'SUCCESS', messages:'loades article',data:applications}, status: :ok
    end
    def create
        application = Application.new(app_params)
        token_hash = Digest::MD5.hexdigest(app_params[:name])
        application.token=token_hash
        chts= Chat.all
        chts_count=chts.where("application_id = ?",params[:application_id]).count
        application.chat_no= chts_count
        msgs= Message.all
        msgs_count=msgs.where("application_id = ?",params[:application_id]).count
        application.msg_no=msgs_count
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
