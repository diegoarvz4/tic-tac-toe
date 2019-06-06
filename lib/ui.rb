module UI
    
    def set_board_dimensions

        dimensions= ['0','1','2','3','4','5','6','7','8']

    end 

    def display
        dimensions = set_board_dimensions
        for i in 0..8
            if i % 3 == 0
                puts"\n" 
               end
            print "[ #{dimensions[i]} ]"
            
        end
        puts "\n"
    end

    #player turn method

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
#method displays input error to user
    def display_input_error
        puts "Please enter a valid input"
    end 
  

#method displays welcome message to users
def welcome_message(player_1, player_2)
    puts "Welcome to the Tic Tac Toe Board Game"
    puts " "
    puts "Player 1 is #{player_1}"
    puts "Player 2 is #{player_2}"
    puts " "
    puts "Enter number to place token "
    puts " "
    puts "GO!"
    puts " "
    display
end

#gets user input
    def user_input
        print "Your move: "
        user_input = gets.chomp
        user_input.to_i
    end 

    def declare_player(player)
        puts "Player #{player} won!"
        puts "GAME OVER!"
    end 

    def declare_tie
        puts "It's a tie!"
        puts "GAME OVER!"
    end 

    end