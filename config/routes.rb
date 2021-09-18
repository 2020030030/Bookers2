Rails.application.routes.draw do
  devise_for :users
  root to:'homes#top'
  get "about" => "top#about" ,as: "about"
  get 'home/about' => 'home#about'

  resources :post_images, only: [:new, :create, :index, :show, :destroy]do
  resource :favorites, only: [:create, :destroy]
  resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
end
