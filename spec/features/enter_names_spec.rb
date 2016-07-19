
feature 'Enter names' do
  scenario 'submitting names' do
    sign_in_and_play
    expect(page).to have_content "Welcome Players! Player1: Aga"
    expect(page).to have_content "Player2: Luke"
  end
end
