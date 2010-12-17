Given /^the following beers? exists?:$/ do |table|
  table.hashes.each do |hash|
    OpenBeerDatabase.beers << hash
  end
end
