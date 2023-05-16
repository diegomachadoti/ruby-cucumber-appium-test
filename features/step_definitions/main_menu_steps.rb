Given('I land on home screen') do
  find_element(id: "action_search")
  find_element(id: "action_add_favorites")
end

When('I press on menu icon') do
  find_element(accessibility_id: "Open navigation drawer").click
end

Then('I should see left side menu') do
  #item_text = find_element(path: "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.view.ViewGroup/android.widget.TextView").find_element(xpath: "//android.widget.TextView[@text='Unit Converter']")
  item_text = find_element(xpath: "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.view.ViewGroup/android.widget.TextView").text
  if item_text != "Unit Converter"
    fail("Cannot find #{item_text} texto menu.")
  end
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