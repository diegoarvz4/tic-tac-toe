
require_relative 'ui.rb' 

class Board

    include UI

    attr_reader :dimensions

    def initialize
        @dimensions = set_board_dimensions
    end


    def set_cell(value, turn)
        row = value[0].to_i
        col = value[1].to_i
        dimensions[row][col] = turn 
    end


    

end

