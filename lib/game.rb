class Game

  attr_reader :player_1, :player_2, :turn

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_player = @players.first
    @opponent = @players.last
    @turn = @current_player
  end

  def player_1
      @players.first
  end

  def player_2
      @players.last
  end

  def attack(player)
    @opponent.receive_damage
    change_turn
  end

private

  def change_turn
    if @current_player == @players.first
      @current_player = @players.last && @opponent = @players.first
    else
        @current_player = @players.first && @opponent = @players.last
    end
  end


end
