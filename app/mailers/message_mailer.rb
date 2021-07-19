class MessageMailer < ApplicationMailer
  def send_message(message)
    @message = message
    mail to: @message.destination, subject: "[Work_Manual_App] #{@message.title}"
  end
end
