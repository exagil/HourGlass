Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout', :sign_up => 'signup'}, controllers: { confirmations: 'confirmations' }
  resources :users, only: :destroy
  get 'welcome' => 'activities#edit'
  get 'dashboard' => 'activities#dashboard'
  resources :activities, only: [:update, :index]
  get 'history' => 'activities#index'
  root 'static_pages#home'
  get 'one' => 'static_pages#one'
end