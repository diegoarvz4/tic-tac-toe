
class Board

    attr_accessor :dimensions

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
        @winner_type = ""

    end 


    def welcome_message(player_1, player_2)
        puts "Welcome to the Tic Tac Toe Board Game"
        puts " "
        puts "Player 1 is #{player_1}"
        puts "Player 2 is #{player_2}"
        puts " "
        puts "Input as xy format. x => row, y => column. 00 input stands for row => 0, column => 0 "
        puts " "
        puts "GO!"
        puts " "
    end 

    def display_player_turn(turn_type, player_1, player_2)

        next_turn = ""
        player_turn = ""
        if turn_type == "x"
            if player_1 == "x"
                player_turn = "#{1}"
            else 
                player_turn  ="#{2}"
            end 
            next_turn = "o"
        else  
            if player_1 == "o"
                player_turn = "#{1}"
            else 
                player_turn  ="#{2}"
            end 
            next_turn = "x"
        end 
        puts "Player #{player_turn} turn"
        next_turn

    end 
  
    def display
        for row in 0..2
            for col in 0..2
                print "[" + "#{@dimensions[row][col]}"+"]"
            end 
            puts ""
        end
    end 

    def set_cell(value, turn)
        row = value[0].to_i
        col = value[1].to_i
        dimensions[row][col] = turn 
    end

    def validate_move(current_move)
        
       if @moves.include? current_move
            return false 
       else 
            @moves << current_move
            return true 
       end  
      
    end

    def user_input

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

    end 

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



end

