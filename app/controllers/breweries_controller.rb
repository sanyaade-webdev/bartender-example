class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.paginate(:column => 'name')
  end

  def show
    @brewery = Brewery.find(params[:id])
  end
end
