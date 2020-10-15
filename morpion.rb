require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/player.rb'
require 'app/board.rb'
require 'app/boardcase.rb'
require 'app/game.rb'
require 'views/show.rb'
require 'views/application.rb'

#############################################################

app = Application.new()
Show.new.show_board(app.current_game)
app.launch_game()
puts #fin de partie"
