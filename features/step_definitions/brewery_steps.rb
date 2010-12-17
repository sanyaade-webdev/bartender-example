Given /^the following (?:brewery|breweries) exists?:$/ do |table|
  table.hashes.each do |hash|
    OpenBeerDatabase.breweries << hash
  end
end
