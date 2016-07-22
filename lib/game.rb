require_relative 'player'

class Game
  attr_reader :player1, :player2, :turn, :players, :game_over

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @players = [player1, player2]
    @turn = @players.first
  end

  def self.create(player1, player2)
    @game = Game.new(player1, player2)
  end

  def self.instance
    @game
  end

  def attack(player)
    player.receive_damage
    player_dead?(player)
    change_turn
  end

  def change_turn
    @players.reverse!
    @turn = @players.first
  end

  def player_dead?(player)
    @game_over = true if player.hitpoints <= 0
  end
end
