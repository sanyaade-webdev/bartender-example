BartenderExample::Application.routes.draw do
  resources :beers,     only: [:index, :show]
  resources :breweries, only: [:index, :show]

  root to: "Pages#index"
end
