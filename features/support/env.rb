# frozen_string_literal: true
require 'capybara'
require 'cucumber'
require 'selenium-webdriver'
require 'capybara/cucumber'
require 'capybara/dsl'
Capybara.default_driver = :selenium
Capybara.app_host = "http://www.redfin.com"
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new app, browser: :chrome
end

World(Capybara::DSL)

Before do |scenario|
  @email = 'jbanh12@yahoo.com'
  @password = 'Acorns!'
end
