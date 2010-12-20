class PagesController < ApplicationController
  def index
    @beer_count    = Beer.count
    @brewery_count = Brewery.count
  end
end
