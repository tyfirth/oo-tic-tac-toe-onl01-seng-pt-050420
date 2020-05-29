class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(position, token)
    @board[position] = token
  end
  
  def position_taken?(index_i)
    @board[index_i] == "X" || @board[index_i] == "O" 
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn 
    puts "Enter 1 - 9"
    input = gets.strip
    index = input_to_index(input)
    token = current_player
      if valid_move?(index)
        move(index, token)
        display_board
      else 
        turn
      end
  end
  
  def turn_count
    turns = 0 
    @board.each do |space|
      if space == "X" || space == "O"
        turns += 1
      end
    end
    return turns
  end
  
  def current_player
    if turn_count % 2 == 0 
      "X"
    else
      "O"
    end
  end
  
  def won?
   WIN_COMBINATIONS.each do |win_combo|
     if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
       return win_combo
     elsif
        (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        return win_combo
      end
   end
   false 
  end
  
  def full?
    @board.all? {|occupied| occupied != " "}
  end
  
end