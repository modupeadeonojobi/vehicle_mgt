Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  authenticated :user do
    root 'dashboard#index' # This route is only accessible to authenticated users
  end

  namespace :api do
    namespace :v1 do
      resources :vehicles, only: [:index, :new, :show, :create, :update, :destroy]
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
