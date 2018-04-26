Feature: Login to Redfin
  I want to log into Redfin.com with a registered account

  Scenario: Login
    Given I navgiated to Redfin
    When I click the login button
    Then A login modal will show appear
    And I can use my credentials to login
    Then I will be logged in