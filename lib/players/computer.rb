module Players
    class Computer < Player
        def move( board )
            input = rand(1...9)
            board.valid_move?(input) ? input.to_s : move
        end
    end
end