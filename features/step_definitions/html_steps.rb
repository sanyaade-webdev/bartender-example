Then /^I should see the following beer:$/ do |table|
  table.hashes.each do |hash|
    should have_css("h2", :text => hash["name"])

    within("#beer-#{hash["id"]}") do
      should have_css("td a[href='#{brewery_path(hash["brewery_id"])}']", :text => hash["brewery_name"])
      should have_css("td", :text => hash["description"])
      should have_css("td", :text => hash["abv"])
      should have_css("td", :text => hash["user_id"].present? ? "No" : "Yes")
      should have_css("td", :text => Time.parse(hash["updated_at"]).strftime("%Y-%m-%d %H:%M:%S"))
      should have_css("td", :text => Time.parse(hash["created_at"]).strftime("%Y-%m-%d %H:%M:%S"))
    end
  end
end

Then /^I should see the following beers:$/ do |table|
  within("#beers") do
    table.hashes.each_with_index do |hash, index|
      within("tr:nth-child(#{index + 1})") do
        should have_css("td a[href='#{beer_path(hash["id"])}']", :text => hash["name"])
        should have_css("td a[href='#{brewery_path(hash["brewery_id"])}']", :text => hash["brewery_name"])
        should have_css("td.public", :text => hash["user_id"].present? ? "No" : "Yes")
        should have_css("td.updated_at", :text => Time.parse(hash["updated_at"]).strftime("%Y-%m-%d %H:%M:%S"))
        should have_css("td.created_at", :text => Time.parse(hash["created_at"]).strftime("%Y-%m-%d %H:%M:%S"))
      end
    end
  end
end

Then /^I should see the following brewery:$/ do |table|
  table.hashes.each do |hash|
    should have_css("h2", :text => hash["name"])

    within("#brewery-#{hash["id"]}") do
      should have_css("td", :text => hash["user_id"].present? ? "No" : "Yes")
      should have_css("td", :text => Time.parse(hash["updated_at"]).strftime("%Y-%m-%d %H:%M:%S"))
      should have_css("td", :text => Time.parse(hash["created_at"]).strftime("%Y-%m-%d %H:%M:%S"))
    end
  end
end

Then /^I should see the following breweries:$/ do |table|
  within("#breweries") do
    table.hashes.each_with_index do |hash, index|
      within("tr:nth-child(#{index + 1})") do
        should have_css("td a[href='#{brewery_path(hash["id"])}']", :text => hash["name"])
        should have_css("td a[href='#{hash["url"]}']", :text => hash["url"])
        should have_css("td.public", :text => hash["user_id"].present? ? "No" : "Yes")
        should have_css("td.updated_at", :text => Time.parse(hash["updated_at"]).strftime("%Y-%m-%d %H:%M:%S"))
        should have_css("td.created_at", :text => Time.parse(hash["created_at"]).strftime("%Y-%m-%d %H:%M:%S"))
      end
    end
  end
end
