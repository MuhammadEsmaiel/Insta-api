class ChatsController < ApplicationController
    def index
        chat= Chat.all;
        render json: {status:'SUCCESS', messages:'loaded chats',data:chat}, status: :ok
    end
    def create
        chat = Chat.new()
        chat.application_id=params[:application_id]
        cht= Chat.all
        chat_count=cht.where("application_id = ?",params[:application_id]).count
        if chat_count == 0
            chat_count = 1
            chat.noOfChat = chat_count
          else
            chat_count = chat_count+1
            chat.noOfChat= chat_count
          end
          application = Application.find(params[:application_id])
          application.update(chat_no: chat_count)
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
