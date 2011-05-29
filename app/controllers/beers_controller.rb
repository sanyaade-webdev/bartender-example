class BeersController < ApplicationController
  def index
    @beers = Beer.paginate(:order => "name", :page => params[:page] || 1)
  end

  def show
    @beer = Beer.find(params[:id])
  end
end
