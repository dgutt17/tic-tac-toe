require_relative "game_logic"
class Game
    attr_accessor :player_x, :player_o, :board

    def self.run
        game_in_process = true
        puts "Enter Player X Name: "
        player_x = gets.chomp
        puts "Enter Player O Name: "
        player_o = gets.chomp
        game = Game.new(player_x, player_o)

        while(game_in_process)
            # Player X process
            game.board_output
            puts "Pick Space #{game.player_x}: "
            space_x = gets.chomp
            if game.space_clear?(space_x)
                game.board[space_x.to_i] = "X"
            else
                keep_picking = true
                while(keep_picking)
                    puts "Pick Space #{game.player_x}: "
                    space_x = gets.chomp
                    if game.space_clear?(space_x)
                        game.board[space_x.to_i] = "X"
                        keep_picking = false 
                    end
                end
            end
            if game.winner?
                puts game.winner?
                puts "Play Again? (Y/N): "
                play_again = gets.chomp
                if play_again == "Y" || play_again == "y"
                    game.board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
                    next
                elsif play_again == "N"
                    return
                else
                    return
                end
            end

            # Player O process
            game.board_output
            puts "Pick Space #{game.player_o}: "
            space_o = gets.chomp
            if game.space_clear?(space_o)
                game.board[space_o.to_i] = "O" 
            else
                keep_picking = true
                while(keep_picking)
                    puts "Pick Space #{game.player_o}: "
                    space_o = gets.chomp
                    if game.space_clear?(space_o)
                        game.board[space_o.to_i] = "O"
                        keep_picking = false 
                    end
                end
            end
            if game.winner?
                puts game.winner?
                puts "Play Again? (Y/N): "
                play_again = gets.chomp
                if play_again == "Y"
                    game.board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
                    next
                elsif play_again == "N"
                    return
                else
                    return
                end
            end
        end
    end

    def initialize(player_x, player_o)
        @player_x = player_x
        @player_o = player_o
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def winner?
        return GameLogic.horizontal_win(self) if GameLogic.horizontal_win(self)
        return GameLogic.vertical_win(self) if GameLogic.vertical_win(self)
        return GameLogic.diagnol_win(self) if GameLogic.diagnol_win(self)
        return GameLogic.draw(self) if GameLogic.draw(self)
    end

    def board_output
        puts
        puts " #{self.board_space(0)}|#{self.board_space(1)}|#{self.board_space(2)}"
        puts " -----"
        puts " #{self.board_space(3)}|#{self.board_space(4)}|#{self.board_space(5)}"
        puts " -----"
        puts " #{self.board_space(6)}|#{self.board_space(7)}|#{self.board_space(8)}"
        puts
    end

    def board_space(index)
        @board[index] == " " ? index : @board[index]
    end

    def space_clear?(index)
        idx = index.to_i
        @board[idx] == " " && idx >= 0 && idx <= 8
    end
end


puts Game.run
