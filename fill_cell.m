function fcell = fill_cell(board)
%%function which creates cell 1x9 storing smaller matrixes from board
fcell = cell(1,9);

for row = 1:3
    for col=1:9
        if rem(row,3)~=0 && rem(col,3)~=0
            matr_numb = (floor(row/3)+1)*(floor(col/3)+1);
        elseif rem(row,3)~=0
            matr_numb = (floor(row/3)+1)*(floor(col/3));
        elseif rem(col,3)~=0
            matr_numb = (floor(row/3))*(floor(col/3)+1);   
        else
            matr_numb = (floor(row/3))*(floor(col/3));   
        end
        fcell{matr_numb} = [fcell{matr_numb} board(row,col)];
    end
end

for row = 4:6
    for col=1:9
        if rem(row,3)~=0 && rem(col,3)~=0
            matr_numb = (floor(col/3)+1)+3;
        elseif rem(row,3)~=0
            matr_numb = (floor(col/3))+3;
        elseif rem(col,3)~=0
            matr_numb = (floor(col/3)+1)+3;   
        else
            matr_numb = (floor(col/3))+3;   
        end
        fcell{matr_numb} = [fcell{matr_numb} board(row,col)];
    end
end

for row = 7:9
    for col=1:9
        if rem(row,3)~=0 && rem(col,3)~=0
            matr_numb = (floor(col/3)+1)+6;
        elseif rem(row,3)~=0
            matr_numb = (floor(col/3))+6;
        elseif rem(col,3)~=0
            matr_numb = (floor(col/3)+1)+6;   
        else
            matr_numb = (floor(col/3))+6;   
        end
        fcell{matr_numb} = [fcell{matr_numb} board(row,col)];
    end
end
