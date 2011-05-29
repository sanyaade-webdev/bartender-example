class BeersController < ApplicationController
  def index
    @beers = Beer.paginate(:order => "name", :page => params[:page])
  end

  def show
    @beer = Beer.find(params[:id])
  end
end
