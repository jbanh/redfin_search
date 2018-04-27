# frozen_string_literal: true

Given (/^I have navigated to Redfin$/) do
  visit Capybara.app_host
end

When (/^I click the login button$/) do
  click_button('Log In')
  expect(page).to have_button('Continue with Email')
end

Then (/^I can use my credentials to login$/) do
  click_button('Continue with Email')
  expect(page).to have_button('Sign In')
  fill_in('Email', :with => 'jbanh12@yahoo.com')
  fill_in('Password', :with => 'Acorns!')
  click_button('Sign In')
end

Then (/^I will be logged in$/) do
  expect(page).to have_selector('[data-rf-test-name="UserMenu"]')
end

Given (/^I have logged into Redfin$/) do
  visit Capybara.app_host
  # click_button('Log In')
  # click_button('Continue with Email')
  # expect(page).to have_button('Sign In')
  # fill_in('Email', :with => 'jbanh12@yahoo.com')
  # fill_in('Password', :with => 'Acorns!')
  # click_button('Sign In')
end

When (/^I make a search$/) do
  fill_in('City, Address, School, Agent, ZIP', :with => 'Newport Beach')
  first('[data-rf-test-name="item-row-active"]').click
  expect(page).to have_selector('[data-rf-test-id="filterButton"]')
end

And (/^Apply a filter for bed, bath, and sqft$/) do
  click_button('Filters')
  expect(page).to have_selector('[data-rf-test-id="apply-search-options"]')
  first(:xpath, '//div[@id=\'filterContent\']/div/div/div/div/div[2]/div/span/span/span/span/span').click
  page.find(:xpath, '//div[@id=\'filterContent\']/div/div/div/div/div[2]/div/span/span/span/div/div/div/div[4]').click
  first('[data-rf-test-name="Stepper"]').click
  page.find(:xpath, '//div[@id=\'filterContent\']/div/div/div/div[2]/div[2]/span/span/span[2]/div/div/div/div[3]').click
  first(:xpath, '//div[@id=\'filterContent\']/div/div[2]/div/div/div[2]/div/span/span/span/span/span').click
  page.find(:xpath, '//div[@id=\'filterContent\']/div/div[2]/div/div/div[2]/div/span/span/span/div/div/div/div[4]/span').click
  page.find(:xpath, '//div[@id=\'searchForm\']/form/div[2]/div/div/button/span').click
  expect(page).to have_selector('[data-rf-test-id="filterButton"]')
end