Rails.application.routes.draw do
  resources :posts
  root 'posts#index'

  mount API::Root => '/'
end
