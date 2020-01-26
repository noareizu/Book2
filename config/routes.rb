Rails.application.routes.draw do
  devise_for :users

  root to: 'books#top'
  get 'home/about' => "books#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:show,:edit,:index,:update,:destroy]
  resources :books, only:[:show,:index,:create,:edit,:update,:destroy]
end
