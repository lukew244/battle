require 'capybara/dsl'
require 'selenium-webdriver'
include Capybara::DSL
Capybara.default_driver = :selenium
visit '/'
fill_in 'Player 1 name', with: 'Aga'
fill_in 'Player 2 name', with: 'Luke'
click_button 'Submit'
