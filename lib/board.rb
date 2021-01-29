class Board
    attr_accessor :cells
    
    def initialize(cells = nil)
        @cells = cells || Array.new(9, " ")
    end

    def display
      puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
      puts "-----------"
      puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
      puts "-----------"
      puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def reset!
        cells.clear
        self.cells = Array.new(9, " ")
    end

    def position(input)
        @cells[input.to_i-1]
     end

     def full?
        !self.cells.include?(" ")
    end

    def turn_count
        self.cells.count("X") + self.cells.count("O")
    end

    def taken?(index)
        if self.position(index) == "X" || self.position(index) == "O" 
            true
        else 
            false
        end 
    end
    
    def valid_move?(input)
        # binding.pry
        if !taken?(input) && input.to_i.between?(1, 9)
            true
        end
    end
    
    def update(input, player)
        self.cells[input.to_i-1] = player.token
    end

    

end