class String
    def numeric?
        true if Float(self) rescue false
    end
end
class TicTacToe
    def initialize
        @board = [[" "," "," "],
                    [" "," "," "],
                    [" "," "," "]]
        @used_spaces = []
    end
    def draw_board
        puts "
                   1   2   3
                 -------------
               1 | #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} |
                 -------------
               2 | #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} |
                 -------------
               3 | #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} |
                 -------------"
    end
    def get_coords(axis)
        while true
            print "Please enter the #{axis} coordinate: "
            coord = gets.chomp
            if !coord.numeric?
                puts "The entered coordinate must be a number!"
            elsif coord.to_i > 3 || coord.to_i < 1
                puts "The entered coordinate must be a number
                      no less than 1 and no greater than 3."
            else
                coord = coord.to_i
                break
            end
        end
        return coord
    end
    def turn(player)
        puts "#{player.upcase}'s turn"
        while true
            xCoord = get_coords("X")
            yCoord = get_coords("Y")

            if @used_spaces.include?(xCoord.to_s.concat(yCoord.to_s))
                puts "Space occupied!"
            else
                @used_spaces.push(xCoord.to_s.concat(yCoord.to_s))
                break
            end
        end
        if player == "x"
            @board[yCoord-1][xCoord-1] = "X"
        elsif player =="o"
            @board[yCoord-1][xCoord-1] = "O"
        else
            puts "#{player} not found"
        end
        
    end
    def check_for_win()

    end
end

game = TicTacToe.new
until false
    game.draw_board
    game.turn("x")
    game.draw_board
    game.turn("o")
end