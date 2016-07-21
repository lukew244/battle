require 'sinatra/base'
require_relative './lib/player.rb'
require_relative './lib/game.rb'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    @player_1_attacks = session[:player_1_attacks]
    erb :play
  end

  post '/attack' do
    $game.attack($game.player_2)
    session[:player_1_attacks] = true
    redirect '/play'
  end

  get '/' do
    'Hello Battle!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
