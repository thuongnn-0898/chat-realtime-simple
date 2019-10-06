class MessageBroadcastJob < ApplicationJob
  #include Sidekiq::Worker
  queue_as :default

  def perform message
    ActionCable.server.broadcast 'room_channel', message: render_message(message)
  end

  private

  def render_message message
    ApplicationController.renderer.render(partial: 'home/message', locals: { message: message })
  end
end
