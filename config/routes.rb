Rails.application.routes.draw do
  resources :comments
  resources :participants
  devise_for :users

  root 'static_pages#landing'
  get '/test', to: 'static_pages#events'
  resources :events
  get '/events/:id/participants_count', to: 'events#participants_count'
  get '/events/:id/comments', to: 'events#comments'

  get '/users/:id', to: 'users#show', as: 'user'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
