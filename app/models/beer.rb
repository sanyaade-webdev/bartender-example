class Beer
  attr_reader :id, :user_id, :name, :description, :abv, :updated_at, :created_at

  def initialize(options = {})
    options.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def brewery
    @brewery = Brewery.new(@brewery) if @brewery.is_a?(Hash)
    @brewery
  end

  def self.count
    Bartender::Beer.all(per_page: 1)["total"].to_i
  end

  def self.find(id)
    Beer.new(Bartender::Beer.find(id))
  end

  def self.paginate(options = {})
    beers    = Bartender::Beer.all(options)
    page     = beers["page"]
    total    = beers["total"]
    per_page = options[:per_page] || 50

    collection = WillPaginate::Collection.new(page, per_page, total)
    collection.replace(beers["beers"].collect { |brewery| Beer.new(brewery) })
  end
end
