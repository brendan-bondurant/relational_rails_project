Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/instrument_builders", to: "instrument_builders#index"
  get "/instrument_builders/:id", to: "instrument_builders#show"
  get "/models", to: "models#index"
  get "/models/:id", to: "models#show"
  # Defines the root path route ("/")
  # root "articles#index"
end
