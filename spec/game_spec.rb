require 'game'

describe Game do
  subject(:game) {described_class.new(player_1, player_2)}
  let(:player_1) {double :player_1}
  let(:player_2) {double :player_2}

  describe '#initialize' do
    it 'has two players' do
      expect(game.player_1).to eq player_1
      expect(game.player_2).to eq player_2
    end
  end

  describe '#attack' do
    it 'attacks a player'  do
      allow(player_2).to receive(:receive_damage)
      expect(player_2).to receive(:receive_damage)
      subject.attack(player_2)
    end
  end
end
