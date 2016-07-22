require 'spec_helper'

feature 'Enter names' do
  scenario "User inputs their name" do
    sign_in_and_play
    expect(page).to have_content("Jess vs. Luke")
  end
end

feature 'Hitpoints' do
  scenario "player1 views player2's hitpoints" do
    sign_in_and_play
    expect(page).to have_content("Luke 100hp")
  end
end

feature 'Attack' do
  scenario "player1 attacks player2" do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content("Jess attacked Luke")
  end

  scenario "player 2's hitpoints fall" do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content("Luke has 90hp")
  end
end

feature 'change turns' do
  scenario 'it changes turns' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content "Turn: Luke"
  end
end

feature 'declare winner' do
  scenario 'a player is dead' do
    sign_in_and_play
    19.times {click_button('Attack')}
    expect(page).to have_content "Luke is dead!"
  end
end
