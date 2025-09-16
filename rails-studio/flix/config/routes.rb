Rails.application.routes.draw do
  resources :users

   root "movies#index"

  get "signup" => "users#new"
  get "signin" => "sessions#new"

   resources :movies do
     resources :reviews
   end

  resource :session, only: [:new, :create, :destroy]
end
