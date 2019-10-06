class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak data
    yeb = Message.create! content: data['message']
    MessageBroadcastJob.perform_later yeb
  end
end
