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

    def render
        (0..3).each do |ele|
            print ele.to_s + ' '
        end
        puts
        (0..3).each do |ele|
            puts ele.to_s + ' '
        end
        @grid.each do |inner|
            puts inner.join(' ')
        end
    end
end