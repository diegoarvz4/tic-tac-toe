module Turns
    
    def setup_turns
        #possible tokens
        types = ["X","O"]
        num_1 = rand(0..1)
        num_2 = num_1 == 1 ? 0 : 1
        #num_1 is the token that starts the match
        types[num_1]
    end
    
    
    def set_next_turn(turn_type)
        return "X" if turn_type == "O"
        return "O"
    end 

    def player_turn(player_1, player_2, current_turn)
        return player_1 if  player_1.token == current_turn
        return player_2
    end 
end 