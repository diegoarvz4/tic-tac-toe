require_relative "board"

class Match

    attr_accessor :board

    attr_accessor :player_1
    attr_accessor :player_2

    attr_accessor :game_over


    def initialize

        selected = assignate_type
        
        @board = Board.new(selected)
        @game_over = false 
        welcome_message
        board.display

    end

    def welcome_message
        puts "Welcome to the Tic Tac Toe Board Game"
        puts " "
        puts "Player 1 is #{@player_1}"
        puts "Player 2 is #{@player_2}"
        puts " "
        puts "Input as xy format. x => row, y => column. 00 input stands for row => 0, column => 0 "
        puts " "
        puts "GO!"
        puts " "

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
        
        
        next_turn = ""
        if board.turn_type == "x"

            if @player_1 == "x"
                puts "Player #{1} turn"
            else 
                puts "Player #{2} turn"
            end 
            next_turn = "o"
        else  
            if @player_1 == "o"
                puts "Player #{1} turn"
            else 
                puts "Player #{2} turn"
            end 
            next_turn = "x"
        end 

        print "Your move: "
        user_input = gets.chomp
        result = check_length(user_input)

        move = @board.validate_move(user_input)
       
        
        until move && result
            puts "Please enter a valid input"
            user_input = gets.chomp
            result = check_length(user_input)
            move = @board.validate_move(user_input)
        end 

        @board.set_cell = user_input

        @board.turn_type = next_turn
       
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

end

