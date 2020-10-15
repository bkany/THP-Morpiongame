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

my_game = Application.new.create_game()
