@gestures
Feature: User able to use gestures

  Scenario: User able to swipe to open Left side menu
    Given I land on home screen
    When I swipe from left to right
    Then I should see left side menu
    Then I swipe from right to left
    And I see "Length" as a current unit converter
