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
	
end
