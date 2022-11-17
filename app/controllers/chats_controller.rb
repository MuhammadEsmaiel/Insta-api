class ChatsController < ApplicationController
    def index
        chat= Chat.all;
        render json: {status:'SUCCESS', messages:'loaded chats',data:chat}, status: :ok
    end
    sum_value = 0;
    def create
        application= Application.find_by_token(params[:token])
        chat = Chat.new()
        chat.application_id=application.id
        sum_value = sum_value + 1;
        if chat.save
            render json: {status:'SUCCESS', messages:'create chat',data:chat}, status: :ok
        else
            render json: {error:"this username is already taken"}
        end
    end

    def show 
        chat=Chat.find(params[:id])
        if chat.save
            render json: {status:'SUCCESS', messages:'loaded chat',data:chat}, status: :ok
        end
    end

    def destroy
        chat = Chat.find(params[:id])
        chat.destroy
        render json: {status:'SUCCESS', messages:'delete chat',data:chat}, status: :ok
    end
    private
        def chat_params
            params.require(:chat).permit([:token])
        end
end
