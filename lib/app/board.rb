class Board
	attr_accessor :game_board

	def initialize()
	@game_board = [][]
		for i in 0..2
			for j in 0..2
				@game_board[i][j] = Boardcase.new()
			end
		end
	end

end

