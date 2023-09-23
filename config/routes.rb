Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  get 'krks/:krk_id/likes' => 'likes#create'
  get 'krks/:krk_id/likes/:id' => 'likes#destroy'
  get 'krks/rank' => 'krks#rank'
 
  get 'krks/kensaks' => 'kensaks#index'

  resources :sindans
 
  
  
  resources :krks do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
    
  end

  resources :kensaks
  root 'krks#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
