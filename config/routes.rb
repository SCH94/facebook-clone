Rails.application.routes.draw do
  
  resources :likes, only: [:create, :destroy]

  resources :notifications, only: [:show]
  resources :comments, only: [:create, :destroy]

  devise_for :users
  resources :users
  resources :posts
  resources :friend_requests, only: :create
  delete 'friend_request/:receiver_id', to: 'friend_requests#destroy', as: 'friend_request'
  post 'accept_friend_request/:request_id', to: 'friend_requests#accept', as: 'accept_request'
  post 'reject_friend_request/:request_id', to: 'friend_requests#reject', as: 'reject_request'
  get 'random_friend', to: 'friend_requests#random', as: 'random_request'
  resources :friendships, only: [:create, :destroy]
  delete 'delete_friend/:friend_id', to: 'friendships#unfriend', as: 'delete_friend'
#   post 'friend_request/:sender_id/:receiver_id', to: 'friend_requests#create', as: 'friend_request'
#   delete 'friendships/:friend_id', to: 'friendships#delete', as: 'delete_friend'
#   post 'accept_friend/:sender_id/:receiver_id', to: 'friend_requests#accept', as: 'accept_friend'
#   post 'reject_friend/:sender_id/:receiver_id', to: 'friend_requests#reject', as: 'reject_friend'
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/help', as: 'help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
