Rails.application.routes.draw do
  devise_for :users
  root to:'homes#top'
  get "about" => "top#about" ,as: "about"
  get 'home/about' => 'home#about'

 
  resources :users
  resources :books

end
