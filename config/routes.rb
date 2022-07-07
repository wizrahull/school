Rails.application.routes.draw do
  devise_for :logins
  devise_for :users
  resources :uploads
 
  resources :users do
    resources :uploads
    resources :posts 
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#temp"
end
