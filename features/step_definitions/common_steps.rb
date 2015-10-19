Then(/^I land on Today's featured article$/) do
  result = find_element(:name, "Today's featured article")
  expect(result).to be_truthy
end


Then(/^I tap on Search button$/) do
  find_element(:id, "org.wikipedia.alpha:id/main_search_bar_text").click
end

Then(/^I land on Search screen$/) do
   expect(text_exact("Recent searches:").text).to eq "Recent searches:"
end

Then(/^I type "([^"]*)"$/) do |search_term|
   # first_textfield.send_keys search_term
   first_textfield.clear
   id("org.wikipedia.alpha:id/search_src_text").send_keys search_term
end

Then(/^I see that (\d+)(?:st|nd|rd|th)? search result include "([^"]*)"$/) do |number, expected_result|
  number = number.to_i - 1
  actual_result = ids("org.wikipedia.alpha:id/page_list_item_title")[number].text
  expect(actual_result).to eq expected_result
end

When(/^I tap on (\d+)(?:st|nd|rd|th)? result$/) do |number|
  number = number.to_i - 1
  ids("org.wikipedia.alpha:id/page_list_item_title")[number].click
end

When(/^I verify that article title include "([^"]*)"$/) do |expected_result|
   # set_network_connection 1
   actual_result = find_element(:id, "org.wikipedia.alpha:id/page_title_text").text
   expect(actual_result).to include expected_result
end
