Feature: Login to Redfin
  I want to log into Redfin.com with a registered account

  Scenario: Login
    Given I have navigated to Redfin
    When I click the login button
    Then I can use my credentials to login
    Then I will be logged in