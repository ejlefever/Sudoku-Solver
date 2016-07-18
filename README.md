# Sudoku Solver

## Sample Input
"-3-5--8-45-42---1---8--9---79-8-61-3-----54---5------78-----7-2---7-46--61-3--5--" 
where "-" indicates an empty space

## Sample Runner Code
board_string = "----------2-65-------18--4--9----6-4-3---57-------------------73------9----------
solved_board = solve(board_string)
if solved?(solved_board)
  puts "The board was solved!"
  puts pretty_board(solved_board)
else
  puts "The board wasn't solved."
end
