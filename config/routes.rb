Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  
  namespcae :api do
    namespace :v1 do
      resources :users, param: :user_id
      resources :ads, param: :ad_id
      resources :comments
    end
  end

  get '*path', to: 'pages#index', via: :all 
end
