class MessagesController < ApplicationController
    def index
         messages= Message.all;
        render json: {status:'SUCCESS', messages:'loaded messages',data:messages}, status: :ok
    end
    def create
        message = Message.new(msg_params)
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
          application = Application.find(params[:application_id])
          application.update(msg_cont: msg_count)
        if message.save
            render json: {status:'SUCCESS', messages:'create message',data:message}, status: :ok
        else
            render json: {error:"error creating this message"}
        end
    end

    def show 
        message=Message.find(params[:id])
        if message.save
            render json: {status:'SUCCESS', messages:'loaded message',data:message}, status: :ok
        end
    end

    def destroy
        message = Message.find(params[:id])
        message.destroy
        render json: {status:'SUCCESS', messages:'delete message',data:message}, status: :ok
    end
    def search
        msgs= Message.search_published(params[:query])
        render json: {status:'SUCCESS', messages:'delete message',data:params}, status: :ok
    end
    def search
        msgs= Message.search(params[:query])
        render json: {status:'SUCCESS', messages:'delete message',data:msgs}, status: :ok
    end
    private
    def msg_params
        params.require(:message).permit([:content])
    end
end
