Given /^the following (?:brewery|breweries) exists?:$/ do |table|
  table.hashes.each do |hash|
    OpenBeerDatabase.breweries << hash
  end
end

Given /^(\d+) breweries exist$/ do |count|
  count.to_i.times do
    steps %{
      Given the following brewery exists:
        | id | user_id | name           | url                 | created_at | updated_at |
        | 1  |         | A Brewery Name | http://abrewery.com | 2010-01-01 | 2010-02-02 |
    }
  end
end
