App.chat = App.cable.subscriptions.create 'ChatChannel',
  received: (data) ->
    if data['event_type'] == 'update_user_name'
      $("strong.user-name-id-#{data['user_id']}").html(data['user_name'])
    if data['event_type'] == 'new_message'
      $('.messages').append("
        <p>
          <strong class=\"user-name-id-#{data['user_id']}\">#{data['user_name']}</strong>
          <span>#{data['message_text']}
        </p>
      ")
