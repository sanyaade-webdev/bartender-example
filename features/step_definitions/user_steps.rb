Given /^the following user exists:$/ do |table|
  table.hashes.each do |hash|
    OpenBeerDatabase.users << hash
  end
end
