class Application 

	# Variable d'instance qui contient le jeu en cours
	attr_accessor :current_game

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
	
	def initialize()
		players = self.create_players()
		@current_game = Game.new(players)
	end

# ---------------------------------- JEU -------------------------------------------
	# Cette méthode demande au joueur quelle case il veut jouer et retourne sa réponse entrée au clavier
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
		while !((answer[0] == "A" || answer[0] == "B" || answer[0] == "C") && (answer[1] == "1" || answer[1] == "2" || answer[1] == "3"))
			puts "Votre réponse est incorrecte. Reprenez-vous cher ami."
			answer = self.ask_case_to_play
		end
		return self.translate_answer(answer)
	end
	
	# Cette méthode vérifie que la case demandée n'est pas déjà occupée par un -x- ou un -o-
	def is_case_to_play_ok(answer)
		if @current_game.game_board.game_board[answer[0]][answer[1]].status == 1
			return false
		else
			return true
		end
	end
	
	def he_merde_bad_case_to_play()
		answer = self.case_to_play(self.ask_case_to_play())
		while self.is_case_to_play_ok(answer) == false
			puts "La case demandée est déjà remplie. Essayer une autre case"
			answer = self.case_to_play(self.ask_case_to_play())
		end
		return answer
	end
	

# ----------------------------- CONDITION DE FIN DE JEU -----------------------------------------
	def end_of_game
		if @current_game.game_board.is_full?() == true
			puts "La partie est terminée, personne n'a gagné !"
		end
		if @current_game.game_board.is_victorious?() == true
			puts "La partie est terminée ! Bravo au gagnant !"
		end
	end

# ----------------------------- DEROULEMENT DU JEU -----------------------------------------
	
	def launch_game
		@current_game.players[0].show
		@current_game.players[1].show

		while (@current_game.game_board.is_full?() == false || @current_game.game_board.is_victorious?() == false)
			
			# Ce IF détermine à quel joueur c'est de jouer
			if (@current_game.players[0].turn_to_play == 1)
				player_turn = @current_game.players[0]
				index = 0
			else
				player_turn = @current_game.players[1]
				index = 1
			end
			
			puts "---- Tour du Joueur #{player_turn.name} ----"
			@current_game.change_case(self.he_merde_bad_case_to_play(), player_turn)
			Show.new.show_board(@current_game)
			
			# On inverse les rôles et le joueur qui n'a pas encore joué devient celui qui jouera au tour suivant
			if index == 0
				@current_game.players[0].must_play(0)
				@current_game.players[1].must_play(1)
			else 
				@current_game.players[0].must_play(1)
				@current_game.players[1].must_play(0)
			end
			
		end
		
	self.end_of_game()
			
	end
	
end
