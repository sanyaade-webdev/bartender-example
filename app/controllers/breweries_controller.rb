class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.paginate(:order => "name")
  end

  def show
    @brewery = Brewery.find(params[:id])
  end
end
