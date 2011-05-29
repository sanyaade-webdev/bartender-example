Given /^the following beers? exists?:$/ do |table|
  table.hashes.each do |hash|
    OpenBeerDatabase.beers << hash
  end
end

Given /^(\d+) beers exist$/ do |count|
  count.to_i.times do
    steps %{
      Given the following brewery exists:
        | id | user_id | name           | url                 | created_at | updated_at |
        | 1  |         | A Brewery Name | http://abrewery.com | 2010-01-01 | 2010-02-02 |
      And the following beer exists:
        | id | brewery_id | name        | created_at | updated_at |
        | 1  | 1          | A Beer Name | 2010-01-01 | 2010-02-02 |
    }
  end
end
