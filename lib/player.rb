
require_relative 'ui.rb' 

class Player

    include UI

    attr_reader :token
    attr_reader :moves

    def initialize(token)
        @token = token
        @moves = []
    end 

    def make_move
        user_input
    end 

    def insert_move(move)
        @moves << move 
    end 


end 

