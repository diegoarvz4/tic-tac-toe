
class Board

    attr_accessor :dimensions
    
    attr_accessor :turn_type

    attr_accessor :moves
   
    def initialize(turn_type)
        @dimensions = []
        for i in 0..2
            dimensions << []
            for j in 0..2
                dimensions[i] << " "
            end
        end 
        @moves = dimensions.clone
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

    def validate_move(current_move)
        
       if @moves.include? current_move
            return false 
       else 
            @moves << current_move
            return true 
       end  
      
    end

    def update_state()

    end


end

