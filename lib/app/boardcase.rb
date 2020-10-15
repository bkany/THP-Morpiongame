class Boardcase
	# Le statut contient l'état de la case (occupé 1 ou vide 0)
	# Le content contient le contenu de la case ("x", "o" ou nil)
	attr_accessor :status, :content
	
	def initialize()
		@status = 0
		@content = " "
	end
	
	def is_empty?
		result = @content == " " ? true : false
		return result
	end
	
	def change_content(camp)
		@status = 1
		@content = camp
	end
	
	def show
		print @content
	end
	
	def is_eq(boardcase)
		if @status == 1 && boardcase.status == 1 && @content == boardcase.content
			return true
		else
			return false
		end
	end
	
	def is_eq_3(boardcase1, boardcase2)
		if self.is_eq(boardcase1) && self.is_eq(boardcase2) && boardcase1.is_eq(boardcase2)
			return true
		else
			return false
		end
	end
	
end
