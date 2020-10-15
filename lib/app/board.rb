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

end

