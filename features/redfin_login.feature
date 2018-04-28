Feature: Login to Redfin and Search
  I want to log into Redfin.com with a registered account

#  Scenario: Login
#    Given I have navigated to Redfin
#    When I click the login button
#    Then I can use my credentials to login
#    Then I will be logged in

  Scenario: Login and Search
    Given I have navigated to Redfin
    When I make a search
    And Apply a filter for bed, bath, and sqft
    Then I will receive results related to my filter
