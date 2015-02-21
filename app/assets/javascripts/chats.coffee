window.client = new Faye.Client('/faye')

client.addExtension {
  outgoing: (message, callback) ->
    message.ext = message.ext || {}
    message.ext.csrfToken = $('meta[name=csrf-token]').attr('content')
    callback(message)
}

jQuery ->
  try
    client.unsubscribe $('#chats').data("query")
  catch
    console?.log "Can't unsubscribe." # print a message only if console is defined
    
  client.subscribe $('#chats').data("query"), (payload) ->
    $('#chats').find('.media-list').append(payload.message) 
    $('#chats').animate({scrollTop: $('#chats').prop("scrollHeight")}, 500);
