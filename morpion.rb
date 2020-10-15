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
#app.current_game.change_case(app.case_to_play(app.ask_case_to_play()), "x")
#Show.new.show_board(app.current_game)

		while (app.current_game.game_board.is_full?() == false || app.current_game.game_board.is_victorious?() == true || i > 9)
			puts "Tour du Joueur 1 #{app.current_game.players[0].name}"
			app.current_game.change_case(app.case_to_play(app.ask_case_to_play()), app.current_game.players[0].camp)
			Show.new.show_board(app.current_game)
			puts "Tour du Joueur 2 #{app.current_game.players[1].name}"
			app.current_game.change_case(app.case_to_play(app.ask_case_to_play()), app.current_game.players[1].camp)
			Show.new.show_board(app.current_game)
		end
		
puts #fin de partie"
