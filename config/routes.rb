Rails.application.routes.draw do
  root to: 'homes#show'
  get '/auth/tumblr', as: :tumblr_login
  get '/auth/tumblr/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#delete'
  resources :users, only: [:show]
  resources :posts, only: [:update]
  resources :likes, only: [:index]
  get 'posts/:id/:key/like' => 'posts#like', via: [:patch, :put], as: :posts_like
end
