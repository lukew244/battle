require 'sinatra/base'
require_relative './lib/player.rb'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  get '/play' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name

    @player_1_hp = $player_1.hit_points
    @player_2_hp = $player_2.hit_points
    @player1_attacks = session[:player1_attacks]
    erb :play
  end

  post '/attack' do
    $player_2.receive_damage
    session[:player1_attacks] = true
    redirect '/play'
  end

  get '/' do
    'Hello Battle!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
