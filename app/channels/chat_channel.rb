class ChatChannel < ActionCable::Channel::Base
  def subscribed
    stream_from 'chat_channel'
  end
end
