
feature 'Enter names' do
  scenario 'submitting names' do
    visit '/'
    fill_in :player1, with: 'Aga'
    fill_in :player2, with: 'Luke'
    click_button 'Submit'
    expect(page).to have_content "Welcome Players! Player1: Aga Player2: Luke"
  end
end
