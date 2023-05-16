Then('I press on Create your first conversion button') do
  find_element(id: "btn_new_custom_conversion").click
  sleep(1)
end

Then('I type {string} as custom conversion name') do |name|
  find_element(id: "edit_custom_conversion_category_name").send_keys(name)
end

When('I press on New unit button') do
  find_element(id: "btn_new_custom_unit").click
  sleep(1)
end

Then('I type {string} as unit name') do |unit_name|
  find_element(id: "edit_custom_conversion_unit_dtls_name").send_keys(unit_name)
end

Then('I type {string} as unit symbol') do |symbol_name|
  find_element(id: "edit_custom_conversion_unit_dtls_symbol").send_keys(symbol_name)
end

Then('I type {string} as unit value') do |unit_value|
  find_element(id: "edit_custom_conversion_unit_dtls_value").send_keys(unit_value)
end

Then('I press submit checkmark on Custom conversions screen') do
  find_element(id: "action_confirm_custom_unit").click
  sleep(1)
end

When('I press on OK button on Custom conversions screen') do
  find_element(id: "btn_custom_conversion_details_ok").click
end

Then('I verify {string} added to Custom conversions list') do |conversion_name|
  find_element(xpath: "//*[contains(@text, #{conversion_name})]")
end
