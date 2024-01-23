require_relative 'card.rb'

class Board 

    def initialize
        @grid = Array.new(4) { Array.new(4) }
    end

    def populate
        faces = []
        ('A'..'H').each do |char|
            faces << char
            faces << char 
        end
        faces.shuffle!
        @grid.map! do |inner|
            inner.map! { |ele| ele = faces.pop }
        end
    end
end