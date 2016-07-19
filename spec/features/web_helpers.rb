

def sign_in_and_play
  visit '/'
  fill_in :player1, with: 'Aga'
  fill_in :player2, with: 'Luke'
  click_button 'Submit'
end
