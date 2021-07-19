class MessagesController < ApplicationController
 
  def new
    @message = Message.new
  end
  def create
    @message = Message.new(message_params)
    if @message.save
      MessageMailer.send_message(@message).deliver_now
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:title, :content, :destination).merge(user_id: current_user.id)
  end
end
