Rails.application.routes.draw do
  resources :activities, only: :index
end
