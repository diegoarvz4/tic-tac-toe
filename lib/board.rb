
class Board

    attr_accessor :dimensions

   
    def initialize()
        @dimensions = []
        for i in 0..2
            dimensions << []
            for j in 0..2
                dimensions[i] << " "
            end
        end 

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
        display
    end 

    def display_player_turn(turn_type, player_1, player_2)

        player_turn = ""
        if turn_type == "x"
            if player_1 == "x"
                player_turn = "#{1}"
            else 
                player_turn  ="#{2}"
            end 
            
        else  
            if player_1 == "o"
                player_turn = "#{1}"
            else 
                player_turn  ="#{2}"
            end 
           
        end 
        puts "Player #{player_turn} turn"

    end 

    def display_input_error
        puts "Please enter a valid input"
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

    
    def declare_player(player)
        puts "Player #{player} won!"
        puts "GAME OVER!"
    end 

    def declare_tie
        puts "It's a tie!"
        puts "GAME OVER!"
    end 


    def user_input

        print "Your move: "
        user_input = gets.chomp
        user_input

    end 

end

