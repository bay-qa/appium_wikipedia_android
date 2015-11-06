Then(/^I land on Today's featured article$/) do
  result = find_element(:name, "Today's featured article")
  expect(result).to be_truthy
end


Then(/^I tap on Search button$/) do
  binding.pry
  find_element(:id, "main_search_bar_text").click
end

Then(/^I land on Search screen$/) do
   expect(text_exact("Recent searches:").text).to eq "Recent searches:"
end

Then(/^I type "([^"]*)" into search field$/) do |search_term|
   first_textfield.clear
   find_element(:id, "search_src_text").send_keys search_term
end

Then(/^I see that (\d+)(?:st|nd|rd|th)? search result include "([^"]*)"$/) do |number, expected_result|
  number = number.to_i - 1
  actual_result = ids("page_list_item_title")[number].text
  expect(actual_result).to eq expected_result
end

When(/^I tap on (\d+)(?:st|nd|rd|th)? result on search result page$/) do |number|
  number = number.to_i - 1
  ids("page_list_item_title")[number].click
end

When(/^I verify that article title include "([^"]*)"$/) do |expected_result|
   # set_network_connection 1
   actual_result = find_element(:id, "page_title_text").text
   expect(actual_result).to include expected_result
end
