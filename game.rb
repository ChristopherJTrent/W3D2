require_relative "board.rb"

class Game
    def initialize
        @board = Board.new
        @previous_guess = []
    end
    def play
        until @board.won?
            @board.render
            Game.prompt 
        end
    end
end