Given('I land on home screen') do
  find_element(id: "action_search")
  find_element(id: "action_add_favorites")
end

When('I press on menu icon') do
  find_element(accessibility_id: "Open navigation drawer").click
end

Then('I should see left side menu') do
  ##text("Unit Converter")
  puts('Comando "text=Unit Converter"')
end

When('I press on My conversions button') do
  ##text("My conversions").click
  find_element(id: "target_value_placeholder").click
end

Then('I land on My conversions screen') do
  find_element(id: "text_info_no_custom_conversions").text.equal?("No personal conversion created yet")
end

When(/^I press on switch units button$/) do
  find_element(id: "img_switch").click
end