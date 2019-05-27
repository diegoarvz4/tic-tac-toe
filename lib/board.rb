
class Board

    attr_accessor :dimensions
    attr_accessor :turn_type

    def initialize(turn_type)
        @dimensions = []
        for i in 0..2
            dimensions << []
            for j in 0..2
                dimensions[i] << " "
            end
        end 

        @turn_type = turn_type

    end 

    
    def display
        for row in 0..2
            for col in 0..2
                print "[" + "#{dimensions[row][col]}"+"]"
            end 
            puts ""
        end
    end 

    def set_cell=(value)

        row = value[0].to_i
        col = value[1].to_i
        
        dimensions[row][col] = @turn_type

    end

end

