class Game
	# Player est un tableau contenant les deux joueurs
	# Game_Board est le plateau de jeu, contenant les 9 cases maximum à remplir
	# Nb_games est le nombre de grilles disputées par les deux joueurs
	# Status correspond à l'état du jeu (1 s'il est en cours, 0 s'il est terminé)
	attr_accessor :players, :game_board, :nb_games, :status

	# La partie s'initialise avec deux joueurs et un plateau de jeu
	def initialize(players)
		@players = players
		@game_board = Board.new()
		@nb_games = 0
		@status = 1
	end
	
	def change_case(board_case, camp)
		@game_board[board_case[0], board_case[1]].change_content(camp)
	end
	
	
end
