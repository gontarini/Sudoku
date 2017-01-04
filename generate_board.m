function board = generate_board
%% Function to create sudoku board map.
% It is based on backtracking algorithm

%%creating random begining board
[board, fu_cell] = put_random_values(zeros(9,9));

%bactracking algorithm
nx = 1; ny = 1;
pr_x = [];pr_y = [];
pointer =0;
over = 0; failed =cell(9,9);
while ny ~=10
    if over == 1
        %%creating random begining board
        [board, fu_cell] = put_random_values(zeros(9,9));
        board_copy = board; %%copy of the original board
        over = 0;failed =cell(9,9);
        pr_x = [];pr_y = [];
        pointer =0; nx = 1; ny = 1;
    end
    i = 0;
    if board(ny,nx)== 0 %%empty, we can put an eleement
        rowRep = 1;colRep =1;istrue =1;
        while rowRep ==1 || colRep ==1 || istrue ==1
            display('working..');
            is = find(nx == pr_x);
            if length(is) == 0 
                pr_x = [pr_x nx]; pr_y = [pr_y ny]; pointer = pointer +1;
            else
                if pr_y(is) ~= ny
                    pr_x = [pr_x nx]; pr_y = [pr_y ny]; pointer = pointer +1;
                end
            end
            i=i+1;
            is = find(i == failed{ny,nx});
            if length(is) == 0
                if i == 10
                    if pointer ~= 1 %%still bug in clearing cell
                        pointer = pointer -1;
                        board(ny,nx) = 0;
                        if length(failed{ny,nx}) ~=0
                            failed{ny,nx} = [];
                        end
                        pr_x = pr_x(1:pointer);pr_y=pr_y(1:pointer);
                        nx = pr_x(pointer); ny = pr_y(pointer);
                        failed{ny,nx} = [failed{ny,nx} board(ny,nx)];
                        
                        matr_number = get_matrix_index(ny,nx);
                        ind = find(fu_cell{matr_number} == board(ny,nx));
                        if length(ind) ~= 0
                            if ind ~= 1
                                fu_cell{matr_number} = fu_cell{matr_number}([1:(ind-1) , (ind+1):length(fu_cell{matr_number})]);
                            else
                                fu_cell{matr_number} = fu_cell{matr_number}([2:length(fu_cell{matr_number})]);
                            end
                        end
                        board(ny,nx) = 0; 
                        break;
                    else
                        over =1; %%unsolvable
                        break;
                    end
                end
                board(ny,nx) = i;
                r = board(ny,:); r_uniq = r(r~=0);
                c = board(:,nx); c_uniq = c(c~=0);
                rowRep = length(unique(r_uniq)) < length(r_uniq);
                colRep = length(unique(c_uniq)) < length(c_uniq);

                if colRep ~=1 && rowRep ~=1
                    [istrue, fu_cell] = check_element(ny,nx,board,fu_cell);
                    if istrue == 0
                        if nx < 9
                            nx =nx+1;
                        else
                            nx = 1; ny = ny+1;
                        end
                    end
                else
                    board(ny,nx) = 0;rowRep = 1;colRep =1;istrue =1;
                end
            else
                if i == 10
                    if pointer ~= 1
                        pointer = pointer -1;
                        pr_x = pr_x(1:pointer);pr_y=pr_y(1:pointer);
                        nx = pr_x(pointer); ny = pr_y(pointer);
                        failed{ny,nx} = [failed{ny,nx} board(ny,nx)];
                        break;
                    else
                        over =1;
                        break;
                    end
                end
            end
        end
    else
        nx=nx+1;
        if nx >9
            nx =1;
            ny=ny+1;
        end
    end
end


