require_relative "board"
require_relative "player"

class Match


    def initialize(board)

        @player_1 = Player.new 
        @player_2 = Player.new
        @turn_type = decide_turns(@player_1, @player_2)
        @board = board 
        @game_over = false 
        @moves = []
        @winner_type = ""
        @board.welcome_message(@player_1.token, @player_2.token)
        
    end

    def game_loop

        until game_over?

            decide_next_turn
            user_move
            @board.display

        end 

        decide_winner_or_tie

    end 

    # Method to evaluate a winner, a tie,
     private
    def game_over?

        winner? || tie?

    end 
     

     def winner?

        board = @board.dimensions

        winner = true 
        for i in 0..board.length-1
            return true if all_equal?(board[i])
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

        winner

     end 

    def tie?
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

    def decide_winner_or_tie

        if @winner_type != "TIE"
            @board.declare_player(@turn_type)
        else  
            @board.declare_tie
        end 
    end 

    # The match selects the characters and decides who starts
    def decide_turns(player_1, player_2)
        #possible tokens
        types = ["x","o"]
        num_1 = rand(0..1)
        num_2 = num_1 == 1 ? 0 : 1
        player_1.set_token(types[num_1])
        player_2.set_token(types[num_2])
        #num_1 is the token that starts the match
        types[num_1]
    end

    def user_move

        @board.display_player_turn(@turn_type, @player_1.token, @player_2.token)
        input = @board.user_input
        length = check_length(input)
        avialable = valid_move(input)

        until length && avialable
            @board.display_input_error
            input = @board.user_input
            length = check_length(input)
            avialable = valid_move(input)
        end
        
        @board.set_cell(input, @turn_type)
        add_move(input)
       
    end 

    def add_move(move)
    
        @moves << move 
    
    end 

    def decide_next_turn

        if @turn_type == "o"
            @turn_type = "x" 
        else  
            @turn_type = "o"
        end 
    end 

  #method to validate input length
    def check_length(input)
        n = input.length
        if n == 2

        else
            return false
        end

        row = input[0].to_i
        col = input[1].to_i
        if row <3 && row >=0 && col <3 && col >= 0
          result = true
        else
            result = false
        end
        return result
    end
    
    # END method to validate input length
    
    def valid_move(current_move)
        
       !@moves.include? current_move
       
     end

end

