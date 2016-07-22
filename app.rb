require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player1 = Player.new(params[:player_1_name])
    player2 = Player.new(params[:player_2_name])
    @game = Game.create(player1, player2)
    redirect '/play'
  end


  post '/player1_attacks' do
    session[:player_attacks] = true
    @game = Game.instance
    @game.attack(@game.players.last)
    redirect '/play'
  end

  get '/play' do
    @game = Game.instance
    @player_attacks = session[:player_attacks]
    erb :play
  end

  run! if app_file == $0

end
