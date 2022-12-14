class ApplicationsController < ApplicationController  
    def index
        application= Application.all;
        render json: {status:'SUCCESS', messages:'loades article',data:application}, status: :ok
    end
    def create
        application = Application.lock.new(app_params)
        application.chat_cont = 0
        application.msg_cont = 0
        if application.save
            render json: {status:'SUCCESS', messages:'create application',data:application}, status: :ok
        else
            render json: {error:"this name is already taken"}
        end
    end
    def show
        application=Application.lock.find(params[:id])
        if application.save
            render json: {status:'SUCCESS', messages:'loaded application',data:application}, status: :ok
        else
            render json: {status:'SUCCESS', messages:'unfounded',data:application}, status: :ok
        end
    end

    def destroy
        application = Application.lock.find(params[:id])
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
