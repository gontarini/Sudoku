function [board, value_cell] = put_random_values(board)
%% Function which puts random values from range 1-9 to empty board

value_cell = cell(1,9);
elements = [1 2 3 4 5 6 7 8 9];

% for j = 1:1
    for i=1:length(elements)
        condition = true; indicator = 0;
        while condition
            x =randint(1,1,[1 9]);
            y =randint(1,1,[1 9]);
           
            matr_number = get_matrix_index(x,y);
            id = find(value_cell{matr_number}==elements(i));
            if length(id) ==0 && board(x,y) == 0 ...
                    && (length(find(board(:,y) == elements(i))) == 0)...
                    && (length(find(board(x,:) == elements(i))) == 0)
                
                board(x,y) = elements(i);
                value_cell{matr_number} = [value_cell{matr_number} elements(i)];
                condition = false;
            end
        end
    end
% end
