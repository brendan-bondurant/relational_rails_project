Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/instrument_builders", to: "instrument_builders#index", as: "builders" 
  
  get "/instrument_builders/new", to: "instrument_builders#new"
  
  get "/instrument_builders/:id", to: "instrument_builders#show"
  
  get "/models", to: "models#index", as: "models"
  
  get "/models/:id", to: "models#show"
  
  get "/instrument_builders/:instrument_builder_id/models", to: "instrument_builder_models#index", as: "everything"
  
  post '/instrument_builders', to: "instrument_builders#create"
  
  get "instrument_builders/:id/edit", to: 'instrument_builders#edit'

  patch "/instrument_builders/:id", to: "instrument_builders#update"

  get "/instrument_builders/:instrument_builder_id/models/new", to: "instrument_builder_models#new", as: "newgear"

  get "/instrument_builders/:instrument_builder_id/value", to: "instrument_builder_models#value"

  post "/instrument_builders/:instrument_builder_id/models", to: "instrument_builder_models#create"

  get 'models/:id/edit', to: 'models#edit'

  patch '/models/:id', to: 'models#update'

  delete "/instrument_builders/:id", to: 'instrument_builders#destroy', as: "destroybuilder"
  
  delete "/models/:id", to: 'models#destroy', as: "destroymodel"
  # Defines the root path route ("/")
  # root "articles#index"
end
