class BeersController < ApplicationController
  def index
    @beers = Beer.paginate(:column => 'name')
  end

  def show
    @beer = Beer.find(params[:id])
  end
end
