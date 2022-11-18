class MessagesController < ApplicationController
    def index
        message= Message.all;
        render json: {status:'SUCCESS', messages:'loaded messages',data:message}, status: :ok
    end
    def create
        message = Message.new()
        message.chat_id=params[:chat_id]
        zoom= Message.all
        boom=zoom.where("application_id == ?",params[:application_id]).count
        msg_count=boom
        if msg_count == nil
            msg_count = 1
            message.msg_number = msg_count
          else
            msg_count = msg_count+1
            msg.msg_number= msg_count
          end
          application = Application.find(params[:application_id])
          application.update(msg_no: msg_count)
        if messag.save
            render json: {status:'SUCCESS', messages:'create message',data:message}, status: :ok
        else
            render json: {error:"this username is already taken"}
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
end
