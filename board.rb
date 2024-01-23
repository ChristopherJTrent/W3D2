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
            inner.map! { |ele| ele = Card.new(faces.pop) }
        end
    end

    def render
        print "  "
        (0..3).each do |ele|
            print ele.to_s + ' '
        end
        puts
        @grid.each_with_index do |inner, idx|
            print idx.to_s + ' '
            puts inner.map{ |card| card.visible ? card.face : ' ' }.join(' ')
        end
    end
    def won?
        @grid.each do |inner|
            inner.each do |card|
                return false unless card.visible
            end
        end
        true
    end
end