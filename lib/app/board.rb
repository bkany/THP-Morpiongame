class Board
	attr_accessor :game_board

	def initialize()
	@game_board = []
		for i in 0..2
			array = []
			for j in 0..2
				array[j] = Boardcase.new()
			end
			@game_board[i] = array
		end
	end
	
	def is_full?()
		for i in 0..2
			for j in 0..2
				if @game_board[i][j].is_empty?() == true
					return false
				end
			end
		end
		return true
	end
	
	def is_victorious?()
	# LIGNE 0 (correspondant à la ligne A)
		if @game_board[0][0].is_eq_3(@game_board[0][1], @game_board[0][2])
			return true
	# LIGNE 1 (correspondant à la ligne B)
		elsif @game_board[1][0].is_eq_3(@game_board[1][1], @game_board[1][2])
			return true
	# LIGNE 2 (correspondant à la ligne C)
		elsif @game_board[2][0].is_eq_3(@game_board[2][1], @game_board[2][2])
			return true
	# COLONNE 0 (correspondant à la colonne 1)
		elsif @game_board[0][0].is_eq_3(@game_board[1][0], @game_board[2][0])
			return true
	# COLONNE 1 (correspondant à la colonne 2)
		elsif @game_board[0][1].is_eq_3(@game_board[1][1], @game_board[2][1])
			return true
	# COLONNE 2 (correspondant à la colonne 3)
		elsif @game_board[0][2].is_eq_3(@game_board[1][2], @game_board[2][2])
			return true
	# DIAGONALE 1 (correspondant à celle qui va de en haut à gauche à en bas à droite)
		elsif @game_board[0][0].is_eq_3(@game_board[1][1], @game_board[2][2])
			return true
	# DIAGONALE 2 (correspondant à celle qui va de en bas à gauche à en haut à droite)
		elsif @game_board[2][0].is_eq_3(@game_board[1][1], @game_board[0][2])
			return true
		else
			return false
		end
	end
	
end

