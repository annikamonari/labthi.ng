window.client = new Faye.Client('/faye')

client.addExtension {
  outgoing: (message, callback) ->
    message.ext = message.ext || {}
    message.ext.csrfToken = $('meta[name=csrf-token]').attr('content')
    callback(message)
}
 
jQuery ->
  client.subscribe $('#chats').data("query"), (payload) ->
    $('#chats').find('.media-list').append(payload.message) if payload.message
    $('#chats').animate({scrollTop: $('#chats').prop("scrollHeight")}, 500);




scroll_to_bottom = (element) ->
  tries = 0
  old_height = new_height = element.height()
  intervalId = setInterval(->
    unless old_height is new_height
      
      # Env loaded
      clearInterval intervalId
      element.animate
        scrollTop: new_height
      , "slow"
    else if tries >= 30
      
      # Give up and scroll anyway
      clearInterval intervalId
      element.animate
        scrollTop: new_height
      , "slow"
    else
      new_height = element.height()
      tries++
    return
  , 100)
  return