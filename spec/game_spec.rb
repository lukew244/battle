require 'game'
require 'player'

describe Game do

  subject(:game) { described_class.new("Luke", "Jess") }

  let(:player1) { double :player1, name: "Luke" }
  let(:player2) { double :player2, name: "Jess" }


  describe 'initialize' do

    it 'is player 1\'s turn' do
      expect(game.turn).to eq player1.name
    end
  end


  describe '#attack' do
    it 'attacks player 2' do
      allow(player2).to receive(:receive_damage)
      allow(player2).to receive(:hitpoints).and_return(90)
      expect(player2).to receive(:receive_damage)
      game.attack(player2)
    end
  end

  describe 'turn' do
    it 'changes turns after an attack' do
      allow(player2).to receive(:receive_damage)
      allow(player2).to receive(:hitpoints).and_return(90)
      game.attack(player2)
      expect(game.turn).to eq player2.name
    end
  end

  describe 'endgame' do
    context 'players are alive' do
      it 'game is not over' do
        allow(player2).to receive(:receive_damage)
        allow(player2).to receive(:hitpoints).and_return(90)
        game.attack(player2)
        expect(game.game_over).not_to be true
      end
    end

    context 'a player has died' do
      it 'game is over' do
        allow(player2).to receive(:receive_damage)
        allow(player2).to receive(:hitpoints).and_return(0)
        game.attack(player2)
        expect(game.game_over).to be true

      end
    end
  end


end
