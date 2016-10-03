class MessageForm
  attr_reader :message, :error

  def initialize(message)
    @message = message
  end

  def submit
    return unless validation
    message.save!
    ChatDeliverer.deliver_message(message)
    true
  end

  private

  def validation
    return true if message.text.present?
    @error = 'Message can\'t be blank'
    nil
  end
end
