# Ruby code file - All your code should be located between the comments provided.

# Main class module
module WOF_Game
	# Input and output constants processed by subprocesses. MUST NOT change.
	GOES = 5

	class Game
		attr_reader :template, :wordtable, :input, :output, :turn, :turnsleft, :winner, :secretword, :played, :score, :resulta, :resultb, :guess
		attr_writer :template, :wordtable, :input, :output, :turn, :turnsleft, :winner, :secretword, :played, :score, :resulta, :resultb, :guess
		
		def initialize(input, output)
			@input = input
			@output = output
			@played = 0
			@score = 0
		end
		
		def getguess
			guess = @input.gets.chomp.upcase
		end
		
		def storeguess(guess)
			if guess != ""
				@resulta = @resulta.to_a.push "#{guess}"
			end
		end
		
		# Any code/methods aimed at passing the RSpect tests should be added below.
		
		# Start Method which displays a welcome message and prints who created the game
		def start
			@output.puts "Welcome to WOF!"
			@output.puts "Created by: #{created_by} (#{student_id})" # Called the "created_by" and "student_id" function and prints their value to the screen
		end

		# Returns the names of the developers
		def created_by
			return "Atanas Komsiyski,Aleksandra Nenkova,Stanislav Stoyanov,Reece Tait"
		end

		# Returns the Student ID of the developers
		def student_id
			return "51985145,51984461,51985020,51982218"
		end

		# Displays 4 menu options for the player to chose from
		def menuoptions
			return "Menu: (1) Play | (2) New | (3) Analysis | (9) Exit\n"
		end

		# Displays a help prompt if requested by the user
		def menuprompt
			return "Select option from menu."
		end

		# Displays a begin game method
		def displaybegingame
			@output.puts "Begin game."
		end

		# Displays a message when a new game is created
		def displaynewgamecreated
			@output.puts "New game created."
		end
		
		# Displays a game analysis message when the analysis option is selected
		def displaygameanalysis
			@output.puts "Analysis of game."
		end

		# Displays a finish game message
		def finish
			@output.puts "Game finished."
		end

		# Displays an error message if the user input is invalid
		def displayinvalidinputerror
			@output.puts "Invalid input."
		end
		
		# Sets the game variables to their default values
		def resetgame
			@wordtable = []
			@secretword = ""
			@turn = 0
			@resulta = []
			@resultb = []
			@winner = 0
			@guess = ""
			@template = "[]"
		end

		# Reads the specified file and stores the information inside it to an array
		def readwordfile(filename)
			file = File.open(filename) # Opens the specified file
			@wordtable = Array.new # Creates a new array
			amount = 0
			file.each do |line|
				amount += 1
				@wordtable.push(line.gsub("\n", "")) # Adds the information on the line into the wordtable array
			end
			return amount # Returns how many lines are in the file
		end

		# Gets a random word from the array and sets it as the secret word
		def gensecretword
			@secretword = @wordtable.sample
			return @secretword.upcase # Capitalises the value of the secret word object and returns it
		end

		# Checks if the secret word is in upper case
		def checkwordupcase?
			word = @secretword
			isup = false
			if @secretword.upcase then # Returns false if the secret word is in lowercase
				isup = true
			end
			return isup
		end

		# Sets the value of the secret word object to the incoming word
		def setsecretword(word)
			@secretword = word
		end

		# Fetches the value of the secret word object
		def getsecretword
			return @secretword
		end

		# Creates a template for the word depending on amount of letters in the word
		def createtemplate
			template = "["
			chars = @secretword.split('') # Splits the secret word object into an array of characters
			chars.each do |c|
				template += "_" # Adds an underscore for each character in the array/word
			end
			template += "]"
			@template = template
			return template
		end

		# Returns the secret word and the corresponding template
		def getsecrettemplate
			return [@secretword, @template]
		end

		# Increaes the amount of turns taken by 1
		def incrementturn
			@turn += 1
		end

		# Sets the turnsleft object to the value of the turnsleft variable then subtracts one from the number of goes avaliable
		def getturnsleft
			@turnsleft = turnsleft
			@turnsleft = GOES - 1 # Sets the value of the turnsleft object to the amount of goes minus 1
		end

		# Displays a message depending on if the player has won or not
		def displaywinner(won)
			if won
				return "Well done. You win."
			else
				return "Sorry, computer wins."
			end
		end

		# Displays the names and ID of the individual developer
		def displaycredits(i, names, ids)
			namez = names.split(/,/) # Splits the names array
			idz = ids.split(/,/) # Splits the ID array

			return namez[i] + " (" + idz[i] + ")" # Returns to name and id at the current index
		end

		# Any code/methods aimed at passing the RSpect tests should be added above.

	end
end


