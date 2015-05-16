Rails.application.routes.draw do
  devise_for :users
  get 'welcome' => 'activities#edit'

  resources :activities, only: [:index, :edit, :update]
  root 'static_pages#home'
end