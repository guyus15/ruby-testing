require 'yaml'

class String
    def numeric?
        true if Float(self) rescue false
    end
end

class Hangman
    @@dictionary = File.readlines "dictionary.txt"

    def initialize(lives_remaining = 12)
        @lives_remaining = lives_remaining
        @word = ""
        @guessed_letters = []
        @correct_guesses = []
        @win_check_num = 0
    end

    def choose_word
        randNum = rand(0..@@dictionary.length-1)
        @word = @@dictionary[randNum].strip.upcase
    end

    def get_guess
        while true
            print "\nEnter your guess here: "
            guess = gets.chomp.to_s
            if guess.numeric?
                puts "Please do not enter numeric characters."
            elsif guess.length > 1 
                if guess.downcase == "save"
                    guess = "save"
                    break
                else
                    puts "Guess length too long!"
                end
            elsif guess.length < 1
                puts "Please enter your guess."
            else
                break
            end
        end

        return guess
    end
    def display_word(guess)

        if @guessed_letters.include?(guess)
            puts "Letter already guessed!"
        else
            @guessed_letters.push(guess)
        end

        @word.split("").each do |letter|
            if letter == guess || @correct_guesses.include?(letter)
                print letter
                @win_check_num += 1 if letter==guess && !@correct_guesses.include?(guess)
            else
                print "-"
            end
        end

        if @word.include?(guess)
            @correct_guesses.push(guess) unless @correct_guesses.include?(guess)
        else
            @lives_remaining -= 1
        end

        puts "\nLives remaining: #{@lives_remaining}"
    end

    def play
        if @word == ""
            puts "Choosing word out of #{@@dictionary.length.to_s} words!"
            choose_word
        end
        until @win_check_num == @word.length
            guess = get_guess.upcase
            if guess == "SAVE"
                save_game
                puts "Would you like to continue playing? y/n: "
                input = gets.chomp.to_s
                if input == "y"
                    puts "Okay"
                elsif input == "n"
                    puts "Okay, thanks for playing!"
                    break
                else
                    puts "Input not recognised. Continuing with game..."
                end
            else
                @lives_remaining > 1 ? display_word(guess) : (game_over; break)
            end
        end
        puts "\nCongratulations you guessed the word #{@word}!" if @win_check_num == @word.length
    end

    def game_over
        puts "GAME OVER! You failed to guess the word #{@word}. :("
    end

    def save_game
        puts "Saving game..."
        save_obj = YAML.dump(self)
        File.open("save_game.txt","w") do |file|
            file.write save_obj
        end
    end

    def play_save
        YAML.load(File.read "save_game.txt").play
    end

    def intro
        puts "Welcome to Hangman!\nSave the game at any time by typing 'save'.\nYou must guess the letter of each word chosen randomly.\nCareful, you only have #{@lives_remaining} lives!"
        unless File.read("save_game.txt") == ""
            print "A save has been detected, would you like to continue this game? y/n: "
            input = gets.chomp.downcase
            if input == "y"
                puts "Loading save..."
                play_save
            elsif input == "n"
                File.open("save_game.txt","w") {|file| file.write ""}
                play
            else
                File.open("save_game.txt","w") {|file| file.write ""}
                puts "Not recognised. Starting a new game..."
                play
            end
        else
            play
        end
    end
end

game = Hangman.new
game.intro
