Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "prototypes#index"
  resources :prototypes, only: [:new, :create, :show,:edit, :update]
end
