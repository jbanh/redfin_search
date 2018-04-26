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

Then (/^I will be logged in $/) do
  expect(page).to have_selector('[data-rf-test-name="UserMenu"]')
end