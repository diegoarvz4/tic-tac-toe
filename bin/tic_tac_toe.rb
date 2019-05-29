require_relative "../lib/match"

match = Match.new

#LOOP GAME

until match.game_over
    puts " "
    match.user_move
    puts " "
    match.board.display
    match.game_over = match.is_over?
    puts " "
    puts "***********"

end 

puts "GAME OVER"
match.call_winner 
