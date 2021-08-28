Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root 'pages#index'
  
  namespace :api do
    namespace :v1 do
      resources :users, param: :user_id
      post "/login", to: "users#login"
      get "/auto_login", to: "users#auto_login"
      
      resources :ads, param: :ad_id
      resources :comments
    end
  end

  #get '*path', to: 'pages#index', via: :all 
end
