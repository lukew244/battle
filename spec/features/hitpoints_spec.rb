feature 'Display player hitpoints' do
  scenario 'Player 1 can see Player 2 hitpoints' do
    sign_in_and_play
    expect(page).to have_content "hitpoints: 50"
  end
end
