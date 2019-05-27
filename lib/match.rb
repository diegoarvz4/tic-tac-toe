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
        puts "Player 1 is #{@player_1}"
        puts "Player 2 is #{@player_2}"

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

        puts "Your move: "
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
    
end
