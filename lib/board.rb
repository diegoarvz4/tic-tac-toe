
class Board

    attr_accessor :dimensions
   
    attr_accessor :turn_type

    attr_accessor :moves

    attr_accessor :winner_type
   
    def initialize(turn_type)
        @dimensions = []
        for i in 0..2
            dimensions << []
            for j in 0..2
                dimensions[i] << " "
            end
        end 
        @moves = []
        @turn_type = turn_type
        @winner_type = ""

    end 

  
    def display
        for row in 0..2
            for col in 0..2
                print "[" + "#{@dimensions[row][col]}"+"]"
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

    def check_winner_triplets()

        winner = true 

        for i in 0..@dimensions.length-1
            return true if all_equal?(@dimensions[i])
        end
        transposed_array = @dimensions.transpose   
        # check each column vertically (3)
        for i in 0..@dimensions.length-1   
            return true if all_equal?(transposed_array[i])
        end
        # check all diagonals

        for i in 0..@dimensions.length - 2
            
            if @dimensions[i][i] != @dimensions[i+1][i+1] || @dimensions[i][i] == " "
                winner = false 
                break  
            end
        end 
       
        return winner if winner

        winner = true 

        for i in 0..@dimensions.length - 2
            if @dimensions[2-i][i] != @dimensions[2-i-1][i+1] || @dimensions[2-i][i] == " "
                winner = false  
                break
            end
        end 

        return winner if winner 

        if @moves.length == 9 
            @winner_type = "TIE"
            return true 
        end 
    end


    def all_equal?(array)
        
        return false if array.uniq.first == " "
        @winner_type = array.uniq.first
        array.uniq.size <= 1
    end



end

