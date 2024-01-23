require_relative 'player.rb'

class ComputerPlayer < Player

    def initialize
        @known_cards = {}
        @matched_cards = []
        @cached_reply = nil 
    end

    def receive_revealed_card(pos, face)
        @known_cards[pos] = face
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