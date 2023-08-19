Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :properties, only: [:index, :create, :update]
      get 'properties/addresses/:address', to: 'properties#get_by_address'
      get 'properties/owners/:owner', to: 'properties#get_by_owner'
      get 'properties/:id', to: 'properties#show'
    end
  end 
end
