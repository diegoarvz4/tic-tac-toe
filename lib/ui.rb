
    
    def set_board_dimensions

        dimensions= [0,1,2,3,4,5,6,7,8]

    end 

    def display
        dimensions = set_board_dimensions
        for i in 0..8
            if i % 3 == 0
                puts"\n" 
               end
            print "[ #{dimensions[i]} ]"
            
        end
        puts "\n"
    end


display