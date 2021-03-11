Rails.application.routes.draw do
  resources :likes
  resources :comments
  resources :posts
  resources :messages
  resources :conversations
  resources :friendships
  resources :follows
  resources :users
  post '/auth', to: 'auth#create'
  get '/current_user', to: 'auth#show'
  post '/find-climbers', to: 'users#find_climbers'
  get '/friend-requests/:id', to: 'users#friend_requests'
  post '/accept-friend', to: 'friendships#accept_friend'
  post '/reject-friend', to: 'friendships#decline_friend'
  post '/message-notification', to: 'messages#delete_notifications'
  get '/user-and-friend-posts/:id', to: 'posts#user_and_friends_posts'
  get '/show-comments/:id', to: 'comments#show_comments'
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
