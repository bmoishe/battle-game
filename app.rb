require 'sinatra/base'
require './lib/player.rb'
require './lib/game.rb'
class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end


  post '/names' do
    #$game = Game.new(Player.new(params[:player_1_name], Player.new(params[:player_2_name]))

    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    # $game = Game.new($player_1, $player_2)
    redirect '/play'
  end


  get '/play' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    @player_1_hp = $player_1.hp
    @player_2_hp = $player_2.hp
    erb :play
  end

  get '/attack' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    Game.new.attack($player_2)
    @player_1_hp = $player_1.hp
    @player_2_hp = $player_2.hp
    erb :attack
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
