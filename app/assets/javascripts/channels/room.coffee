App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    console.log('connected');

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data);
    $('#message').append data['message'];

  speak:(message) ->
    @perform 'speak', message: message
