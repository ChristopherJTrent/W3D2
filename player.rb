
class Player
    def prompt
        raise NotImplementedError
    end

    def receive_revealed_card(pos, face)
        return
    end

    def receive_match(pos1, pos2)
        return
    end
end 