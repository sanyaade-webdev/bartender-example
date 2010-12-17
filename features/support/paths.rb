module NavigationHelpers
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'

    when /^the beers page$/
      beers_path
    when /^the "(.*)" beer page$/
      beer = OpenBeerDatabase.beers.find { |beer| beer['name'] == $1 }
      beer_path(beer['id'])
    when /^the breweries page$/
      breweries_path
    when /^the "(.*)" brewery page$/
      brewery = OpenBeerDatabase.breweries.find { |brewery| brewery['name'] == $1 }
      brewery_path(brewery['id'])

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
