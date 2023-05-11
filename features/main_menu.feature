Feature: As a user I ant to convert units

  Scenario: When I tap on menu icon, I should see left side menu
    Given I land on home screen
    When I press on menu icon
    Then I should see left side menu

  Scenario: i should be able to open My convertion screen
    Given I land on home screen
    When I press on menu icon
    And I press on My conversions button
    Then I land on My conversions screen