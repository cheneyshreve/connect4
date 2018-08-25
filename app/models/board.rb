class Board < ApplicationRecord
  # attr_accessor :board, :position, :turn_count

  def initialize
    super
    self.turn_count = 0
    self.total_turns = 0
  end

  def board
    [self.row1, self.row2, self.row3, self.row4, self.row5, self.row6]
  end

  def player_number
    self.turn_count.even? ? 1 : 2
  end

  def place_marker(column)
    marker = self.turn_count.even? ? marker = "X" : marker = "O"
    self.total_turns += 1
    column -= 1 #starts at index 0
    x = 5
    until self.board[x][column] == " "
      x -= 1
    end
    self.board[x][column] = marker
    [x, column]
  end

  # returns true or false for a winning line
  def check_line(a,b,c,d)
    ((a != " ") && (a == b) && (a == c) && (a == d))
  end

  # method for evaluating if there is a winner
  # note: if self.total_turns > 42 then the controller will render the "draw" window
  def win?
    # initialize winner as false to start, players 1 and 2 are assigned 1, 2 by default
    winner = false
    # check rows (horizontal win)
    0.upto(2) do |i|
     0.upto(6) do |j|
       result = check_line(self.board[i][j], self.board[i+1][j], self.board[i+2][j], self.board[i+3][j])
       if result === true
         return winner = self.board[i][j]
       end
     end
    end

    # check columns (vertical win)
    0.upto(5) do |i|
     0.upto(3) do |j|
      result = check_line(self.board[i][j], self.board[i][j+1], self.board[i][j+2], self.board[i][j+3])
       if result  === true
        return winner = self.board[i][j]
       end
     end
    end

    # check left_diagonal
     0.upto(2) do |i|
      0.upto(3) do |j|
       result = check_line(self.board[i][j], self.board[i+1][j+1], self.board[i+2][j+2], self.board[i+3][j+3])
       if result === true
        return winner = self.board[i][j]
       end
     end
    end

    # check right_diagonal
     3.upto(5) do |i|
       0.upto(3) do |j|
       result = check_line(self.board[i][j], self.board[i-1][j+1], self.board[i-2][j+2], self.board[i-3][j+3])
       if result === true
        return winner = self.board[i][j]
       end
     end
    end
     return winner
  end



end
