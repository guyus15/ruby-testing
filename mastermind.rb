class Mastermind
    def initialize(code_length = 6, lives_remaining = 12)
        @colours = ["red", "blue", "green", "yellow", "grey", "brown", "orange"]
        @code_length = code_length
        @code = ""
        @lives_remaining = lives_remaining
    end
    def create_code
        tempCode = ""
        @code_length.times{tempCode.concat(@colours[rand(@colours.length)] + '|')}
        tempCode = tempCode[0...-1]
        return tempCode
    end
    def get_correct_guesses
        correctCounter = 0 
        guessString = ""
        for i in 1..@code_length
            print "Enter code colour guess #{i}: "
            guess = gets.chomp
            
            if guess == @code.split('|')[i-1]
                correctCounter += 1
            end
            
        end
        return correctCounter
    end
    def play
        welcome_string = "Welcome to Mastermind!\nYou will have #{@lives_remaining} guesses to crack the #{@code_length} colour code!\nPossible colours are:"
        puts welcome_string
        for num_colours in 0..@colours.length-1
            puts "-#{@colours[num_colours]}"
        end

        @code = create_code

        while @lives_remaining > 0
            correct_guesses = get_correct_guesses
            puts "You have #{correct_guesses}/#{@code_length} colours correct!"
            if correct_guesses == @code_length
                puts "Congratulations. You have guessed the code!"
                break
            end
        end

    end
end

game = Mastermind.new
game.play