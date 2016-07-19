
feature 'Enter names' do
  scenario 'submitting names' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content "Player 1 has attacked player 2"
  end
end
