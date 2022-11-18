class MessagesController < ApplicationController
    def index
        message= Message.all;
        render json: {status:'SUCCESS', messages:'loaded messages',data:message}, status: :ok
    end
    def create
        message = Message.new(msg_params)
        message.chat_id=params[:chat_id]
        message.application_id=params[:application_id]
        zoom= Message.all
        boom=zoom.where("application_id == ?",params[:application_id]).count
        msg_count=boom
        if msg_count == nil
            msg_count = 1
            message.msg_number = msg_count
          else
            msg_count = msg_count+1
            message.msg_number= msg_count
          end
          application = Application.find(params[:application_id])
          application.update(msg_no: msg_count)
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
    private
    def msg_params
        params.require(:message).permit([:text])
    end
end
