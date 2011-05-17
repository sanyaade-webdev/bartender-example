class Brewery
  attr_reader :id, :user_id, :name, :url, :updated_at, :created_at

  def initialize(options = {})
    options.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def self.count
    Bartender::Brewery.all(:per_page => 1)["total"].to_i
  end

  def self.find(id)
    Brewery.new(Bartender::Brewery.find(id))
  end

  def self.paginate(options = {})
    breweries = Bartender::Brewery.all(options)
    page      = breweries["page"]
    total     = breweries["total"]
    per_page  = options[:per_page] || 50

    collection = WillPaginate::Collection.new(page, per_page, total)
    collection.replace(breweries["breweries"].collect { |brewery| Brewery.new(brewery) })
  end
end
