module Validation

    def input_validation(input, board, player_1_moves, player_2_moves)

        length = check_length(input)
        avialable = valid_move(input, player_1_moves, player_2_moves)

        until length && avialable
            board.display_input_error
            input = board.user_input
            length = check_length(input)
            avialable = valid_move(input, player_1_moves, player_2_moves)
        end

        input 

    end 
    
    def check_length(input)
        
        if input.is_a?(Integer) && input >= 0 && input <= 8
            return true
        else
            return false
        end
    end

    def commit_move(board, input, token, player)

        board.set_cell(input, token)
        player.insert_move(input)
    end 
    
    # END method to validate input length
    
    def valid_move(current_move, player_1_moves, player_2_moves)
       #!@moves.include? current_move
       moves =  player_1_moves + player_2_moves
       return true unless moves.include?(current_move)

    end
end 