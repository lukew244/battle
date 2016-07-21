require 'spec_helper'
require '../battle/app.rb'

feature 'attacking' do
  scenario 'on attacking player 2' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'Player 1 attacked Player 2'
  end

  scenario 'hp reduced after attack' do
  sign_in_and_play
  click_button 'Attack'
  expect(page).to have_content '90HP'
  end
end
