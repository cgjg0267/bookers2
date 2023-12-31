Rails.application.routes.draw do
  

  root to: "homes#top"
  get '/home/about' => 'homes#about', as: 'home_about'
  
  devise_for :users
  
  resources :books, only: [:show, :edit, :index, :update, :destroy, :create]
  resources :users, only: [:show, :edit, :index, :update]
  
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
