require_relative 'player.rb'

class HumanPlayer < Player 
    def prompt
        puts "type two numbers separated by a space"
        player_input = gets.chomp.split(" ").map{|ele| ele.to_i}
        return prompt if player_input.any? { |ele| ele > 3 }
        player_input
    end
end