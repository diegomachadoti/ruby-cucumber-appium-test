Then('Left Unit picker value should be {string}') do |value|
  actual_picker_text = find_element(id: "select_unit_spinner").text
  puts(actual_picker_text)
  if actual_picker_text != value
    fail("Expected unit picker value is #{value}, actual value is #{actual_picker_text}")
  end
end

Then('Right unit picker value should be {string}') do |value|
  puts('Right unit picker value is ' + value)
end

Then('Show All button should be {string}')  do |state|
  if state == "enabled"
    puts('button is enabled')
  elsif state == "disabled"
    puts ('button is disabled')
  end
end


When('I press on Clear button') do
  puts('clear button is pressed')
end


When('I type {string} to target text field') do |target|
  puts('target is' + target)
end

Then('I should see result as {string}') do |result|
  puts('result is' + result)
end


#  User able to add current conversion to Favorites list
Then('I press on Add to Favorites icon') do
  find_element(id: "action_add_favorites").click
end

Then('I press on Favorite conversions') do
  sleep(1)
  #text("Favorite conversions").click
  find_element(xpath: "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.support.v4.widget.DrawerLayout/android.widget.ListView/android.widget.RelativeLayout[1]/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.TextView").click
end

Then('I verify {string} added to Favorite conversions list') do |unit_type|
  find_element(id: "favorites_item_hint").text.equal?(unit_type)
end

Then('I press on search icon') do
  find_element(id: "action_search").click
end

Then('I type {string} in search field') do |text|
  find_element(id: "search_src_text").send_keys(text)
end

Then('I press return button on soft keyboard') do
  Appium::TouchAction.new.tap(x:0.99, y:0.99, count: 1).perform
end

Then('I see {string} as a current unit converter') do |current_unit|
  find_element(xpath: "//*[contains(@text, #{current_unit})]")
end


