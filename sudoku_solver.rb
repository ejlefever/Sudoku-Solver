
def solve(board_string)
  board_array = board_string.split("")
  solve_helper(board_array)
  board_array
end

def solve_helper(board)
  board.each_with_index do |number, index|
    if number == "-"
      ['1','2','3','4','5','6','7','8','9'].each do |attempt|
        if valid_cell?(attempt, index, board)
          board[index] = attempt
          if solve_helper(board)
            return true
          else
            board[index] = "-"
          end
        end
      end
      return false
    end
  end
  return true
end

def valid_cell?(attempt, index, board)
  board_copy = Array.new(board)
  return false unless valid_in_row?(attempt, index, board)
  return false unless valid_in_column?(attempt, index, board)
  return false unless valid_in_square?(attempt, index, board)
  true
end

def find_start_index_row(index, board)
  index - index % 9
end

def find_start_index_column(index, board)
  index % 9
end

def find_start_index_square(index, board)
  if index == 0 || index == 1 || index == 2 || index == 9 || index == 10 || index == 11 || index == 18 || index == 19 || index == 20
    return 0
  elsif index == 3 || index == 4 || index == 5 || index == 12 || index == 13 || index == 14 || index == 21 || index == 22 || index == 23
    return 3
  elsif index == 6 || index == 7 || index == 8 || index == 15 || index == 16 || index == 17 || index == 24 || index == 25 || index == 26
    return 6
  elsif index == 27 || index == 28 || index == 29 || index == 36 || index == 37 || index == 38 || index == 45 || index == 46 || index == 47
    return 27
  elsif index == 30 || index == 31 || index == 32 || index == 39 || index == 40 || index == 41 || index == 48 || index == 49 || index == 50
    return 30
  elsif index == 33 || index == 34 || index == 35 || index == 42 || index == 43 || index == 44 || index == 51 || index == 52 || index == 53
    return 33
  elsif index == 54 || index == 55 || index == 56 || index == 63 || index == 64 || index == 65 || index == 72 || index == 73 || index == 74
    return 54
  elsif index == 57 || index == 58 || index == 59 || index == 66 || index == 67 || index == 68 || index == 75 || index == 76 || index == 77
    return 57
  else
    return 60
  end
end

def valid_in_row?(attempt, index, board)
  starting_index = find_start_index_row(index, board)
  row = board[starting_index..starting_index+8]
  row.each_with_index do |elem, idx|
    return false if elem == attempt && index != idx
  end
  true
end

def valid_in_column?(attempt, index, board)
  starting_index = find_start_index_column(index, board)
  col = [board[starting_index]]
  8.times do
    starting_index += 9
    col << board[starting_index]
  end
  col.each_with_index do |elem, idx|
    return false if elem == attempt && index != idx
  end
  true
end

def valid_in_square?(attempt, index, board)
  starting_index = find_start_index_square(index, board)
  square = [board[starting_index], board[starting_index+1], board[starting_index+2], board[starting_index+9], board[starting_index+10], board[starting_index+11], board[starting_index+18], board[starting_index+19], board[starting_index+20]]
  square.each_with_index do |elem, idx|
    return false if elem == attempt && index != idx
  end
  true
end

def solved?(board)
  board_copy = Array.new(board)
  return false if board_copy.sort != ['1', '1', '1', '1', '1', '1', '1', '1', '1',
                                      '2', '2', '2', '2', '2', '2', '2', '2', '2',
                                      '3', '3', '3', '3', '3', '3', '3', '3', '3',
                                      '4', '4', '4', '4', '4', '4', '4', '4', '4',
                                      '5', '5', '5', '5', '5', '5', '5', '5', '5',
                                      '6', '6', '6', '6', '6', '6', '6', '6', '6',
                                      '7', '7', '7', '7', '7', '7', '7', '7', '7',
                                      '8', '8', '8', '8', '8', '8', '8', '8', '8',
                                      '9', '9', '9', '9', '9', '9', '9', '9', '9']
  return false unless rows_complete?(board)
  return false unless column_complete?(board)
  return false unless boxes_complete?(board)
  true
end

def rows_complete?(board)
  [0, 9, 18, 27, 36, 45, 54, 63, 72].each do |starting_index|
    row = board[starting_index..starting_index+8]
    return false if row.sort! != ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end
  true
end

def column_complete?(board)
  [0, 1, 2, 3, 4, 5, 6, 7, 8].each do |starting_index|
    col = [board[starting_index]]
    8.times do
      starting_index += 9
      col << board[starting_index]
    end
    return false if col.sort! != ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end
  true
end

def boxes_complete?(board)
  [0, 3, 6, 27, 30, 33, 54, 57, 60].each do |starting_index|
    square = [board[starting_index], board[starting_index+1], board[starting_index+2], board[starting_index+9], board[starting_index+10], board[starting_index+11], board[starting_index+18], board[starting_index+19], board[starting_index+20]]
    return false if square.sort! != ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end
  true
end

def pretty_board(board)
  board_string = ""
  [0, 9, 18, 27, 36, 45, 54, 63, 72].each do |starting_index|
    board_string += board[starting_index..starting_index+8].join(" ") + "\n"
  end
  board_string
end