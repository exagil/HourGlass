Rails.application.routes.draw do
  devise_for :users
  get 'welcome' => 'activities#edit'


  resources :activities, only: [:update]
  get 'history' => 'activities#index'
  root 'static_pages#home'
end