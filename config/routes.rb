Rails.application.routes.draw do
  root 'static_pages#landing'
  get '/test', to: 'static_pages#events'
  resources :events
  get '/events/:id/participants', to: 'events#participants'
  resources :participants
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
