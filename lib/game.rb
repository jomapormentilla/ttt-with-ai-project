class Game
    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def initialize( p1=nil, p2=nil, board=Board.new )
        @player_1 = p1 == nil ? Players::Human.new("X") : p1
        @player_2 = p2 == nil ? Players::Human.new("O") : p2
        @board = board
    end

    def current_player
        turn = @board.turn_count
        turn % 2 == 0 ? @player_1 : @player_2
    end

    def won?
        WIN_COMBINATIONS.detect{ |combo| @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && @board.cells[combo[0]] != " " }
    end

    def draw?
        @board.full? && !won? ? true : false
    end

    def over?
        draw? || won? ? true : false
    end

    def winner
        !won? ? nil : @board.cells[won?[0]]
    end

    def turn
        puts "Please enter 1-9:"
        input = current_player.move( current_player.token )
        if @board.valid_move?( input )
            @board.cells[ input.to_i - 1 ] = current_player.token
            @board.display
        else
            turn
        end
    end

    def play
        until over? do
            turn
        end

        puts won? ? "Congratulations #{ winner }!" : "Cat's Game!"
    end
end