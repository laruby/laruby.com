
When /^I view the page, I should see "([^\"]*)" navigation links$/ do |number_of_links|
  response.should have_tag("#navigation li", :count => number_of_links.to_i)
end

Then /^I should see the "([^\"]*)" link$/ do |link_name|
  response.should have_tag("#navigation li", :text => /#{link_name}/)
end
