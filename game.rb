require_relative "board.rb"

class Game
    def initialize
        @board = Board.new
        @previous_guess = []
        @current_player = nil
    end
    def play
        @board.render
        until @board.won?
            @board.render
            make_guess(prompt)
            #prompt returns [x, y] 
            system('clear')
        end
    end

    def make_guess(pos)
        @board[pos].reveal
        if @previous_guess == []
            @previous_guess = pos
        else
            unless @board[pos] == @board[@previous_guess]
                system('clear')
                @board.render
                sleep(2)
                @board[pos].hide 
                @board[@previous_guess].hide
            end
            @previous_guess = []
        end
    end

    def get_guess
        player_input = @current_player.prompt
        until @board.open_pos?(player_input) 
            player_input = @current_player.prompt 
        end
        player_input
    end
end