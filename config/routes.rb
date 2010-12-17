BartenderExample::Application.routes.draw do
  resources :beers,     :only => [:index, :show]
  resources :breweries, :only => [:index, :show]
end
