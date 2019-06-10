require_relative "board"
require_relative "player"
require_relative 'validation.rb' 
require_relative 'turn_management.rb' 

class Match

    include Validation
    include Turns 

    def initialize(board, player_1, player_2)

        @board = board 
        @player_1 = player_1
        @player_2 = player_2
        @turn_type = setup_turns
        @winner_type = ""
    end

    def game_loop

        @board.welcome_message(@player_1.token, @player_2.token)

        until game_over?

            @turn_type = set_next_turn(@turn_type)
            user_move
            game_state

        end 

        decide_winner_or_tie

    end 

    # Method to evaluate a winner, a tie,
    private

    def game_state
        @board.display
    end 


    def game_over?
        board = @board.dimensions
        winner?(board) || tie?(board)
    end 
     

    def winner?(board)
        return true if check_horizontal_winning(board)
        return true if check_vertical_winning(board)
        return true if cehck_diagonal_winning(board)
        false
    end 

    def tie?(board)
        if board.is_full? 
            @winner_type = "TIE"
            return true 
        end 
    end 

    def check_horizontal_winning(board)
        #vertical and horizonal equality checks
        j = 0
        for i in 0...3
            return true if (board[j]==board[j+1])&&(board[j+1]==board[j+2])
            j += 3
        end
        false 
    end 

    def check_vertical_winning(board)
        #verticals equality test
        j = 0
        for i in 0...3
            return true if (board[j]==board[j+3])&&(board[j+3]==board[j+6])
            j += 1
        end
        false 
    end 

    def cehck_diagonal_winning(board)
        #diagonals equality test
        return true if (board[0]==board[4])&&(board[4]==board[8])
        return true if (board[2]==board[4])&&(board[4]==board[6]) 
        false 
    end 

    def decide_winner_or_tie

        if @winner_type != "TIE"
            @board.declare_player(@turn_type)
        else  
            @board.declare_tie
        end 
    end 

    def user_move
        @board.display_player_turn(@turn_type, @player_1.token, @player_2.token)
        current_player = player_turn(@player_1, @player_2, @turn_type)
        input = current_player.make_move
        input = input_validation(input, @board, @player_1.moves, @player_2.moves)
        commit_move(@board, input, @turn_type, current_player) 
    end 


   
    
end

