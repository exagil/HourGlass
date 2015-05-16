Rails.application.routes.draw do
  devise_for :users
  get 'welcome' => 'activities#new'

  resources :activities, only: [:index, :new, :create]
  root 'static_pages#home'
end