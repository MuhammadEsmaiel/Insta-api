class ChatsController < ApplicationController
    def index
        chat= Chat.all;
        render json: {status:'SUCCESS', messages:'loaded chats',data:chat}, status: :ok
    end
    
    def create
        application_id= Application.find_by(token :params[:token])
        render json: {status:'SUCCESS', messages:'loaded chats',data:params[:token]}, status: :ok
       # if chat.save
        #    render json: {status:'SUCCESS', messages:'create chat',data:chat}, status: :ok
        #else
         #   render json: {error:"this username is already taken"}
        #end
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
            params.require(:chat).permit([:token,:noofchat])
        end
end
