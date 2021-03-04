Rails.application.routes.draw do
  resources :messages
  resources :conversations
  resources :friendships
  resources :follows
  resources :users
  post '/auth', to: 'auth#create'
  get '/current_user', to: 'auth#show'
  post '/find-climbers', to: 'users#find'
  get '/friend-requests/:id', to: 'users#friend_requests'
  post '/accept-friend', to: 'friendships#accept_friend'
  post '/reject-friend', to: 'friendships#decline_friend'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
