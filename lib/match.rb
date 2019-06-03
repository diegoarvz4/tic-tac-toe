require_relative "board"

class Match

    attr_accessor :board

    attr_accessor :player_1
    attr_accessor :player_2

    attr_accessor :game_over

    attr_accessor :turn_type

    def initialize(board)

        @turn_type = assignate_type
        @board = board 
        @game_over = false 
        welcome_message(@player_1, player_2)
        board.display
    end


    def assignate_type

        types = ["x","o"]

        num_1 = rand(0..1)
        num_2 = num_1 == 1 ? 0 : 1

        @player_1 = types[num_1]
        @player_2 = types[num_2]

        types[num_1]
    end

    def user_move
        
        next_turn = @board.display_player_turn(turn_type, player_1,player_2)

        @board.user_input()
        

        @board.set_cell(user_input, @turn_type)

        turn_type = next_turn
       
    end 

    #method to validate input length
    
    # END method to validate input length
    
    # Method to evaluate a winner, a tie,
    def is_over?

        @board.check_winner_triplets

    end 

    def call_winner

        msg_win = " "

        if @board.winner_type == "TIE"
            puts "It's a tie"
        else 
            if @player_1 == @board.winner_type
                msg_win = "#{1}"
                
            else 
                msg_win = "#{2}"
                
            end 

            puts "Player #{msg_win} wins"
        end 
        

    end 

    def check_winner_triplets(board, moves)

        winner = true 

        for i in 0..board.length-1
            return true if all_equal?(@board[i])
        end
        transposed_array = board.transpose   
        # check each column vertically (3)
        for i in 0..board.length-1   
            return true if all_equal?(transposed_array[i])
        end
        # check all diagonals

        for i in 0..board.length - 2
            
            if board[i][i] != board[i+1][i+1] || board[i][i] == " "
                winner = false 
                break  
            end
        end 
       
        return winner if winner

        winner = true 

        for i in 0..board.length - 2
            if board[2-i][i] != board[2-i-1][i+1] || board[2-i][i] == " "
                winner = false  
                break
            end
        end 

        return winner if winner 

        if moves.length == 9 
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

