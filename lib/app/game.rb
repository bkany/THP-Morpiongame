class Game
	# Player est un tableau contenant les deux joueurs
	# Game_Board est le plateau de jeu, contenant les 9 cases maximum à remplir
	# Nb_games est le nombre de grilles disputées par les deux joueurs
	attr_accessor :players, :game_board, :nb_games

	# La partie s'initialise avec deux joueurs et un plateau de jeu
	def initialize(players)
		@players = players
		@game_board = Board.new()
		@nb_games = 0
	end
	
	def change_case(board_case, player)
		@game_board.game_board[board_case[0]][board_case[1]].change_content(player.camp)
	end
	
	def recharge_board
		@game_board = Board.new()
		@nb_games = @nb_games + 1
	end
	
end
