Rails.application.routes.draw do
  root 'homes#top'
  get "top"=> "homes#top"
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :show, :edit, :update, :destroy, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

