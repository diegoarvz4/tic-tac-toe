require_relative "board"
require_relative "player"

class Match


    def initialize(board)

        @player_1 = Player.new("X")
        @player_2 = Player.new("O")
        @turn_type = decide_turns
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
        #vertical and horizonal equality checks
        j = 0
       for i in 0...3
        return true if (board[j]==board[j+1])&&(board[j+1]==board[j+2])

        j += 3
       end
       #verticals equality test
       j = 0
       for i in 0...3

        return true if (board[j]==board[j+3])&&(board[j+3]==board[j+6])
        j += 1
       end

       #diagonals equality test
     
        return true if (board[0]==board[4])&&(board[4]==board[8])
        return true if (board[2]==board[4])&&(board[4]==board[6])
     

      false
     end 

    def tie?
        if @moves.length == 9 
            @winner_type = "TIE"
            return true 
        end 
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
        types = ["X","O"]
        num_1 = rand(0..1)
        num_2 = num_1 == 1 ? 0 : 1
        
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
        @moves << input
        
       
       
    end 

  

    def decide_next_turn

        if @turn_type == "O"
            @turn_type = "X" 
        else  
            @turn_type = "O"
        end 
    end 

  #method to validate input length
    def check_length(input)
        
        if input.is_a?(Integer) && input >= 0 && input <= 8
        return true
        else
            return false
        end
    end
    
    # END method to validate input length
    
    def valid_move(current_move)
        
       !@moves.include? current_move
       
     end

end

