Rails.application.routes.draw do
  resources :follows
  resources :users
  post '/auth', to: 'auth#create'
  get '/current_user', to: 'auth#show'
  post '/find-climbers', to: 'users#find'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
