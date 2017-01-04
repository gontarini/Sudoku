function matr_number = get_matrix_index(x,y)
row_remainder = rem(x,3); col_remainder = rem(y,3);
row_int = floor(x/3); col_int = floor(y/3);

if col_remainder == 0 && row_remainder == 0
    if x==6
        matr_number = floor(y/3) +3;
    elseif x ==9
        matr_number = floor(y/3) + 6;
    else
        matr_number = floor(x/3)*floor(y/3);
    end
else
    if x > 3 && x <= 6
        indicator =3;
        row_int = 1;
    elseif x >  6 && x <= 9
        row_int = 1;
        indicator = 6;
    else
        indicator = 0;
        row_int = 1;
    end
    
    if col_remainder ~= 0
        col_int = col_int +1;
    end
    
    matr_number = row_int*col_int + indicator;
end