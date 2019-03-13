class GameLogic
    
    def self.horizontal_win(game)
        board = game.board
        if board[0] != " " && board[1] != " " && board[2] != " " && board[0] == board[1] && board[1] == board[2]
            if board[1] == "X"
                return "#{game.player_x} has Won!"
            else
                return "#{game.player_o} has Won!"
            end
        end

        if board[3] != " " && board[4] != " " && board[5] != " " && board[3] == board[4] && board[4] == board[5]
            if board[4] == "X"
                return "#{game.player_x} has Won!"
            else
                return "#{game.player_o} has Won!"
            end
        end

        if board[6] != " " && board[7] != " " && board[8] != " " && board[6] == board[7] && board[7] == board[8]
            if board[7] == "X"
                return "#{game.player_x} has Won!"
            else
                return "#{game.player_o} has Won!"
            end
        end
        return false
    end

    def self.vertical_win(game)
        board = game.board
        if board[0] != " " && board[3] != " " && board[6] != " " && board[0] == board[3] && board[3] == board[6]
            if board[3] == "X"
                return "#{game.player_x} has Won!"
            else
                return "#{game.player_o} has Won!"
            end
        end

        if board[1] != " " && board[4] != " " && board[7] != " " && board[1] == board[4] && board[4] == board[7]
            if board[4] == "X"
                return "#{game.player_x} has Won!"
            else
                return "#{game.player_o} has Won!"
            end
        end

        if board[2] != " " && board[5] != " " && board[8] != " " && board[2] == board[5] && board[5] == board[8]
            if board[5] == "X"
                return "#{game.player_x} has Won!"
            else
                return "#{game.player_o} has Won!"
            end
        end

        return false
    end

    def self.diagnol_win(game)
        board = game.board
        if board[0] != " " && board[4] != " " && board[8] != " " && board[0] == board[4] && board[4] == board[8]
            if board[4] == "X"
                return "#{game.player_x} has Won!"
            else
                return "#{game.player_o} has Won!"
            end
        end

        if board[2] != " " && board[4] != " " && board[6] != " " && board[2] == board[4] && board[4] == board[6]
            if board[4] == "X"
                return "#{game.player_x} has Won!"
            else
                return "#{game.player_o} has Won!"
            end
        end

        return false
    end

    def self.draw(game)
        board = game.board
        count = 0
        board.each do |space|
            if space != " "
                count += 1
            end
        end

        if count == 9
            return "It was a draw!"
        end

        return false
    end
end