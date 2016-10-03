class MessagesController < ApplicationController
  before_action :authorize


  def index
    @message = current_user.messages.new
    @messages = Message.last(30)
  end

  def create
    message = current_user.messages.new(text: params[:message][:text])
    form = MessageForm.new(message)
    if form.submit
      render nothing: true
    else
      flash[:error] = form.error
      redirect_to messages_path
    end
  end

end
