Rails.application.routes.draw do
  get 'searches/search'
  devise_for :users
  root to:'home#top'
  get 'home/about' => 'home#about'
  get '/search', to: 'searches#search'

  resources :books do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
  end

  resources :users do
  resource :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end

end
