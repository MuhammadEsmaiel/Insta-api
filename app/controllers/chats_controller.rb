class ChatsController < ApplicationController
    def index
        chats= Chat.all;
        cht = chats.where("application_id = ?",params[:application_id])
        render json: {status:'SUCCESS', messages:'loaded chats',data:cht}, status: :ok
    end
    def create
        chat = Chat.lock.new()
        chat.application_id= params[:application_id]
        chats= Chat.all;
        cht_sum=chats.where("application_id = ?",params[:application_id]).count
        if cht_sum == 0
            cht_sum = 1
           chat.chat_no = cht_sum
          else
            cht_sum = cht_sum+1
            chat.chat_no= cht_sum
          end
        application = Application.lock.find(params[:application_id])
        application.update(chat_cont: cht_sum)
        application.save
        if chat.save
            render json: {status:'SUCCESS', messages:'create chat',data:chat}, status: :ok
        else
            render json: {error:"creating this chat"}
        end
    end


    def destroy
        chat = Chat.lock.find(params[:id])
        chat.destroy
        render json: {status:'SUCCESS', messages:'delete chat',data:chat}, status: :ok
    end
end
