Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :properties, only: [:index, :create, :update]
      get 'properties/address/:address', to: 'properties#get_by_address'
      get 'properties/owner/:owner', to: 'properties#get_by_owner'
      get 'properties/filter', to: 'properties#filter_properties'
      get 'properties/:id', to: 'properties#show'
    end
  end 
end
