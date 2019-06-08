
require_relative 'ui.rb' 

class Board

    include UI

    attr_reader :dimensions

    def initialize
        @dimensions= [0,1,2,3,4,5,6,7,8]
    end


    def set_cell(value, turn)
        @dimensions[value] = turn 
    end

    def is_full?

        @dimensions.all? { |square| square.is_a?(String) }

    end 

    

end

