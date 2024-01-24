require_relative "board.rb"
require_relative "computer_player.rb"
require_relative "human_player.rb"

class Game
    def initialize
        @board = Board.new
        @previous_guess = []
        @player_1 = HumanPlayer.new
        @player_2 = ComputerPlayer.new
        @current_player = @player_1
    end

    def switch!
        @current_player = @current_player == @player_1 ? @player_2 : @player_1 
    end

    def play
        until @board.won?
            @board.render
            make_guess(@current_player.prompt)
            system('clear')
            @board.render
            make_guess(@current_player.prompt)
            #prompt returns [x, y] 
            system('clear')
            switch!
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