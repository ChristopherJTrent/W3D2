require_relative 'player.rb'

class ComputerPlayer < Player

    def initialize
        @known_cards = Hash.new{|hash, key| hash[key] = Array.new}
        @matched_cards = []
        @cached_reply = nil 
    end

    def match 
        # for each key-value pair in known cards
        #       where key is a string "face"
        #       and value is an array of [x,y] positions
        #   if the value's length is greater than 1
        #       add that value to @matched_cards
        #       set the value at key to nil
        @known_cards.each_pair do |key, value|
            if value.length > 1
                @matched_cards << value
                @known_cards[key] = nil
            end
        end
    end

    def receive_revealed_card(pos, face)
        # {face => [pos, pos, pos]}
        @known_cards[face] << pos
        match
    end

    def receive_match(pos1, pos2)
        @matched_cards << [pos1, pos2]
    end

    def prompt
        if @cached_reply
            retval = @cached_reply
            @cached_reply = nil
            return retval
        end
        if @matched_cards.length > 0
            retval, @cached_reply = @matched_cards.pop
            return retval
        end
        return [rand(4), rand(4)]
    end

end