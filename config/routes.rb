Rails.application.routes.draw do

  get 'searches/search'
  devise_for :users

  root :to =>"homes#top"
  get "home/about"=>"homes#about"

  resources :menus, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :menu_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end

  get '/search', to: 'searches#search'

end
