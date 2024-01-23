class Card

    attr_reader :face, :visible

    def initialize(face)
        @face = face
        @visible = false
    end

    def to_s
        visible ? @face : ""
    end

    def hide
        @visible = false
    end

    def reveal
        @visible = true
    end

    def ==(other)
        face == other.face
    end
end