Rails.application.routes.draw do
  require 'sidekiq/web'
  root 'home#index'
  mount ActionCable.server => "/cable"
  mount Sidekiq::Web => '/sidekiq'
end
