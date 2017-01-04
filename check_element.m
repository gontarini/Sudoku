function [istrue, value_cell] = check_element(x,y, board, value_cell)
%% Function to check whether element is correct to be put into the board.

matr_number = get_matrix_index(x,y);
id = find(value_cell{matr_number}==board(x,y));
if length(id) ==0     
    value_cell{matr_number} = [value_cell{matr_number} board(x,y)];
    istrue = 0;
else
    istrue = 1;
end