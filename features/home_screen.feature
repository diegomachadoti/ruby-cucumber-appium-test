@home_screen
Feature: Tests for Home screen functionality

  @default
  Scenario: Default values on Home screen is Foot and Centimeter
    Given I land on home screen
    Then Left Unit picker value should be "Foot"
    And Right unit picker value should be "Centimeter"

  Scenario: Show All button should bu enabled at launch
    Given I land on home screen
    Then Show All button should be 'enabled'
    When I press on Clear button
    Then Show All button should be "disabled"

  @conversions
  Scenario Outline: Verify default conversion
    Given I land on home screen
    When I type "<target>" to target text field
    Then I should see result as "<result>"
    Examples:
    |target|result|
    |1     |12    |
    |2     |24    |
    |3     |36    |
    |9     |106   |

  Scenario: User able to add current conversion to Favorites list
    Given I land on home screen
    Then I press on Add to Favorites icon
    When I press on menu icon
    Then I press on Favorite conversions
    And I verify "Length" added to Favorite conversions list

  @wip
  Scenario: User able to search by existing Conversion type
    Given I land on home screen
    Then I press on search icon
    Then I type "Temperature" in search field
    And I press return button on soft keyboard
    Then I see "Temperature" as a current unit converter
    Then Left Unit picker value should be "Celsius"
    And Right unit picker value should be "Fahrenheit"
