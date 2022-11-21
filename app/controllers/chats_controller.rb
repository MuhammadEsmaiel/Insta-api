class ChatsController < ApplicationController
    def index
        chat= Chat.all;
        render json: {status:'SUCCESS', messages:'loaded chats',data:chat}, status: :ok
    end
    def create
        chat = Chat.new()
        chat.noOfChat=0
        chat.applications_id=1
        if chat.save
            render json: {status:'SUCCESS', messages:'create chat',data:chat}, status: :ok
        else
            render json: {error:"creating this chat"}
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
end
