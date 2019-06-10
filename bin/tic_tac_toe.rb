require_relative "../lib/match"

board = Board.new
player_1 = Player.new("X")
player_2 = Player.new("O")
match = Match.new(board, player_1, player_2)

#LOOP GAME

match.game_loop


