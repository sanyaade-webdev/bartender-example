class OpenBeerDatabase
  cattr_reader :beers, :breweries, :users

  def self.reset!
    @@beers     = []
    @@breweries = []
    @@users     = []
  end
end

ShamRack.at('api.openbeerdatabase.com').sinatra do
  helpers do
    def paginate(collection)
      column, order = params['order'].to_s.split(' ', 2)
      column ||= 'id'
      order  ||= 'ASC'

      collection.slice(per_page * (page - 1), per_page).sort do |a, b|
        order == 'DESC' ? b[column] <=> a[column] : a[column] <=> b[column]
      end
    end

    def database
      OpenBeerDatabase
    end

    def page
      (params[:page] || 1).to_i
    end

    def per_page
      (params[:per_page] || 50).to_i
    end
  end

  get '/v1/beers.json' do
    beers = paginate(database.beers).each do |beer|
      brewery = database.breweries.find { |brewery| brewery['id'] == beer['brewery_id'] }

      beer['brewery'] = { 'id' => brewery['id'], 'name' => brewery['name'] }
    end

    { :page  => page,
      :pages => (database.beers.size / per_page.to_f).ceil,
      :total => database.beers.size,
      :beers => beers
    }.to_json
  end

  get '/v1/beers/:id.json' do |id|
    beer    = database.beers.find { |beer| beer['id'] == id }
    brewery = database.breweries.find { |brewery| brewery['id'] == beer['brewery_id'] }

    beer['brewery'] = { 'id' => brewery['id'], 'name' => brewery['name'] }
    beer.to_json
  end

  get '/v1/breweries.json' do
    { :page      => page,
      :pages     => (database.breweries.size / per_page.to_f).ceil,
      :total     => database.breweries.size,
      :breweries => paginate(database.breweries)
    }.to_json
  end

  get '/v1/breweries/:id.json' do |id|
    brewery = database.breweries.find { |brewery| brewery['id'] == id }
    brewery.to_json
  end
end

Before do
  OpenBeerDatabase.reset!
end
