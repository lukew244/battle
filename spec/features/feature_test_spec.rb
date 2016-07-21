require 'spec_helper'
require '../battle/app.rb'

feature 'Enter names' do
  scenario 'submitting names' do
    sign_in_and_play
    expect(page).to have_content 'Will vs. Mike'
  end
 end

 feature 'View hit points'do
   scenario 'see Player 2 hit points' do
     sign_in_and_play
     expect(page).to have_content 'Mike: 100HP'
   end
 end

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

feature 'switch turns' do
  scenario 'turn changes after attack' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'Player 2\'s turn'
  end
end
