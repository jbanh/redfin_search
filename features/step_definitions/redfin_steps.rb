# frozen_string_literal: true
require 'selenium-webdriver'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'

Selenium::WebDriver::Chrome.driver_path="/Users/jbanh/Downloads/chromedriver"
browser = Selenium::WebDriver.for :chrome

Given (/^I navgiated to Redfin$/) do
  browser.navigate.to "https://www.redfin.com"
end