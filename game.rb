require_relative "board.rb"

class Game
    def initialize
        @board = Board.new
        @previous_guess = []
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
    def prompt
        puts "type two numbers separated by a space"
        player_input = gets.chomp.split(" ").map{|ele| ele.to_i}
        return prompt if player_input.any? { |ele| ele > 3 }
        return prompt unless @board.open_pos?(player_input)
        player_input
    end
end