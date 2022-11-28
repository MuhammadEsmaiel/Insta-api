class MessagesController < ApplicationController
    def index
         messages= Message.all;
         msg = messages.where("chat_id = ?",params[:chat_id]).where("application_id = ?",params[:application_id])
        render json: {status:'SUCCESS', messages:'loaded messages',data:msg}, status: :ok
    end
    def create
        message = Message.lock.new(msg_params)
        message.chat_id=params[:chat_id]
        message.application_id=params[:application_id]
        messages= Message.all;
        msg_count= messages.where("application_id = ?",params[:application_id]).count
        if msg_count == 0
            msg_count = 1
            message.msg_no = msg_count
          else
            msg_count = msg_count+1
            message.msg_no= msg_count
          end
          application = Application.lock.find(params[:application_id])
          application.update(msg_cont: msg_count)
          application.save
        if message.save
            render json: {status:'SUCCESS', messages:'create message',data:message}, status: :ok
        else
            render json: {error:"error creating this message"}
        end
    end

    def show 
        message=Message.lock.find(params[:id])
        if message.save
            render json: {status:'SUCCESS', messages:'loaded message',data:message}, status: :ok
        end
    end

    def destroy
        message = Message.lock.find(params[:id])
        message.destroy
        render json: {status:'SUCCESS', messages:'delete message',data:message}, status: :ok
    end
    def search
        if params[:query]
            msgs= Message.search_msg(params[:query])
            render json: {status:'SUCCESS', messages:'message you searched for',data:msgs}, status: :ok
        else
            render json: {status:'SUCCESS', messages:'no query passed'}, status: :ok
        end
    end
    private
    def msg_params
        params.require(:message).permit([:content])
    end
end
