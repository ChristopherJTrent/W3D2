require_relative "board.rb"

class Game
    def initialize
        @board = Board.new
        @previous_guess = []
    end
    def play
        until @board.won?
            system('clear')
            @board.render
            #prompt returns [x, y]
            make_guess(prompt) 
        end
    end

    def make_guess(pos)
        if @previous_guess == []
            @board[pos].reveal
            @previous_guess = pos
        else
            unless @board[pos] == @board[previous_guess]
                @board[pos].hide 
                @board[previous_guess].hide
            end
            @previous_guess = []
        end
    end
end