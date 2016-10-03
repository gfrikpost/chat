module ChatDeliverer

  class << self

    def update_user_name(user)
      data = { event_type: 'update_user_name', user_id: user.id, user_name: user.name }
      broadcast(data)
    end

    def deliver_message(message)
      user = message.user
       data = {
         event_type: 'new_message',
         user_id: user.id,
         user_name: user.name,
         message_text: message.text
       }
      broadcast(data)
    end

    private

    def broadcast(data)
      ActionCable.server.broadcast('chat_channel', data)
    end
  end
end
