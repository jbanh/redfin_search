# frozen_string_literal: true
require_relative '../pages/login'

Given (/^I have navigated to Redfin$/) do
  visit Capybara.app_host
end

When (/^I click the login button$/) do
  click_button(login_screen.login_button)
  expect(page).to have_button(login_screen.continue_email_button)
end

Then (/^I can use my credentials to login$/) do
  click_button(login_screen.continue_email_button)
  expect(page).to have_button(login_screen.sign_in_button)
  fill_in(login_screen.email_field, :with => @email)
  fill_in(login_screen.password_field, :with => @password)
  click_button(login_screen.sign_in_button)
end

Then (/^I will be logged in$/) do
  expect(page).to have_selector(login_screen.user_menu)
end

When (/^I make a search$/) do
  fill_in(search_filter.search_bar, :with => 'Newport Beach')
  first(search_filter.first_search_selection).click
  expect(page).to have_selector(search_filter.filter_button)
end

And (/^Apply a filter for bed, bath, and sqft$/) do
  click_button(search_filter.filter_link)
  expect(page).to have_selector(search_filter.apply_filter)
  first(:xpath, search_filter.min_bed_dropdown).click
  page.find(:xpath, search_filter.min_bed_select_two).click
  first(search_filter.min_bath_dropdown).click
  page.find(:xpath, search_filter.min_bath_select_one_quarter).click
  first(:xpath, search_filter.square_footage_dropdown).click
  page.find(:xpath, search_filter.sqft_select_1250).click
  page.find(:xpath, search_filter.apply_search_button).click
  expect(page).to have_selector(search_filter.filter_button)
end

Then (/^I will receive results related to my filter$/) do
  click_button(results_table.table_view)
  page.all(:css, '.tableRow').each do |x|
    Integer(x.find(:css, results_table.bedroom_column).text).should be >= 2
  end

  page.all(:css, '.tableRow').each do |x|
    Float(x.find(:css, results_table.bathroom_column).text).should be >= 1.25
  end

  page.all(:css, '.tableRow').each do |x|
    Integer((x.find(:css, results_table.sqft_column).text).gsub(',', '')).should be >= 1250
  end
end