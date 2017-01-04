function iscorrect = check_solution(board)
%% Function to check correctness of user solution

any_zeros = find(board ==0);
if length(any_zeros) ~= 0
    iscorrect = 2;
else
    cel = fill_cell(board); %%

    %%checking if matrix is correct
    iscorrect = 1;
    for i=1:9
        value = length(unique(cel{i}(cel{i}~=0))) < length(cel{i}(cel{i}~=0));
        if value ==1
            iscorrect =0;
            break;
        end
    end
    for row=1:9
        for col = 1:9
            r = board(row,:); r_uniq = r(r~=0);
            c = board(:,col); c_uniq = c(c~=0);
            rowRep = length(unique(r_uniq)) < length(r_uniq);
            colRep = length(unique(c_uniq)) < length(c_uniq);
            if rowRep ==1 || colRep == 1
                iscorrect = 0;
                break;
            end
        end
    end
end
