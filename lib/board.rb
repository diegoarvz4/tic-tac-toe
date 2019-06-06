
require_relative 'ui.rb' 

class Board

    include UI

    attr_reader :dimensions

    def initialize
        @dimensions = set_board_dimensions
    end


    def set_cell(value, turn)
       
        dimensions[value] = turn 
    end


    

end

