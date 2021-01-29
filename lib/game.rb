class Game
    attr_accessor :board, :player_1, :player_2
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,4,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [6,4,2]  
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board= Board.new)
        @board = board
        @player_1 = player_1  
        @player_2 = player_2
    end

    def current_player
        @board.turn_count.even? ? player_1 : player_2
    end

    def won?
        WIN_COMBINATIONS.each do |win_combos|
            if @board.cells[win_combos[0]] == "X" && @board.cells[win_combos[1]] == "X" && @board.cells[win_combos[2]] == "X"
                return win_combos
            elsif @board.cells[win_combos[0]] == "O" && @board.cells[win_combos[1]] == "O" && @board.cells[win_combos[2]] == "O"
                return win_combos 
            end
        end
        return false
    end

    def draw? 
        if self.won?
            false
        elsif @board.full?
            true
        end
    end

    def over?
        won? || draw?
    end

    def winner
        # binding.pry
       if won? 
        @board.cells[won?[0]]
       end
    end

    def turn
        puts "Please make a move 1-9"
        index_play = current_player.move(@board)
        if @board.valid_move?(index_play)
            @board.update(index_play, current_player)
        else puts "Please make a move 1-9"
            @board.display
            turn
        end
        @board.display
    end

    def play
        turn until over?
        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
      end
end