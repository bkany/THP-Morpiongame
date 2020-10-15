class Application 

# ------------------------------ INITIALISATION DU JEU -------------------------------
	# Cette méthode demande le nom du joueur. 
	def ask_name(rank)
		puts "Quel est le nom du joueur #{rank} ?"
		print "> "
		return gets.chomp
	end
	
	# Cette méthode demande les noms aux deux joueurs et attribuent les "x" et les "o"
	def create_players()
		players = []
		for i in 1..2 do
			players << Player.new(ask_name(i), i)
		end
		return players
	end
	
	def create_game()
		players = self.create_players()
		new_game = Game.new(players)
		return new_game
	end

# ---------------------------------- JEU -------------------------------------------
	def ask_case_to_play()
		puts "Quelle case voulez-vous jouer ?"
		print "> "
		return gets.chomp
	end
	
	# Cette méthode traduit une case écrite par le joueur du type A2, B3, C1 en une case [i, j] exploitable pour le board
	def translate_answer(answer)
		case_to_play = []
		case answer[0]
		when "A"
			case_to_play << 0
		when "B"
			case_to_play << 1
		when "C"
			case_to_play << 2
		end
		case answer[1]
		when "1"
			case_to_play << 0
		when "2"
			case_to_play << 1
		when "3"
			case_to_play << 2
		end		
		return case_to_play
	end
	
	# Cette méthode demande au joueur de rentrer correctement la case à jouer, et la transforme en une vraie case [i, j] (et non pas A1, B2 ou C3)
	def case_to_play(answer)
		while !((answer[0] == "A" || answer[0] == "B" || answer[0] == "C") && (answer[1] == 1 || answer[1] == 2 || answer[1] == 3))
			puts "Votre réponse est incorrecte. Reprenez-vous cher ami."
			answer = self.ask_case_to_play
		end
		return translate_answer(answer)
	end
	
end
