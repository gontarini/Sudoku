function board = clear_random_cells(board, number)
%% Function to randomly delete board fields
%% Board argument is already filled board map,
%% Meanwhile, number is the value indicating how many fields should be deleted

for i=1:number-1
    x =randint(1,1,[1 9]);
    y =randint(1,1,[1 9]);
    while board(x,y)==0
        x =randint(1,1,[1 9]);
        y =randint(1,1,[1 9]);
    end
    
    board(x,y) =0;
end
