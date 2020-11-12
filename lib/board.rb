class Board
    attr_accessor :cells

    def initialize
        @cells = Array.new(9, " ")
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position( input )
        index = input.to_i - 1
        @cells[index]
    end

    def full?
        @cells.all?{ |index| index != " " }
    end

    def turn_count
        @cells.select{ |cell| cell != " " }.count
    end

    def taken?( index )
        position( index ) != " " ? true : false
    end

    def valid_move?( input )
        index = input.to_i - 1
        index.between?(0,9) && !taken?( input.to_i ) ? true : false
    end

    def update( input, player )
        index = input.to_i - 1
        @cells[index] = player.token
    end

    def reset!
        @cells.clear
        @cells = Array.new(9," ")
    end
end