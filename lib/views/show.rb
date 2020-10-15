class Show 

	def show_board(game)
	
		i = 0
		j = 0
		while i <= 2
			while j <= 2
				print " | "
				print game.game_board.game_board[i][j].show
				j += 1
			end
			j = 0
			i += 1
			puts " | "
		end
	end

end
