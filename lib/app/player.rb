class Player
	attr_accessor :name, :turn_to_play, :camp, :nb_win_lose 

	def initialize(name, rank)
		@name = name
		@turn_to_play = (rank == 1 ? 1 : 0)
		@camp = (rank == 1 ? "x" : "o")
		@nb_win_lose = [0, 0] 
	end
	
	#Affichage d'un joueur
	def show
		puts "Le joueur #{@name} joue avec les -#{@camp}-"
	end
	
	# Lorsque le joueur joue une case dans le board, il change la case "case_to_play" et y met son "x" ou son "o"
	def plays(game_board, case_to_play)
		game_board.change_case(case_to_play, @camp)
		@turn_to_play = 0
	end
	
	# Lorsque l'adversaire a joué une case, c'est au tour du joueur de jouer
	def must_play(value)
		@turn_to_play = value
	end
	
end
