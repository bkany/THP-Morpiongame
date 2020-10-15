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

app = Application.new
Show.new.show_board(app.current_game)
app.current_game.change_case(app.case_to_play(app.ask_case_to_play()), "x")
Show.new.show_board(app.current_game)
puts app.current_game.game_board.is_victorious?()
