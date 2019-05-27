require_relative "../lib/match"

match = Match.new

#LOOP GAME

until match.game_over
    puts "***********"
    match.user_move
    match.board.display
    puts "***********"

end 