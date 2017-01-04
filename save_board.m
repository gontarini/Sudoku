function [] = save_board(board)
%% Function to save generated board to .txt file

fid = fopen('48.txt', 'wt'); % Open for writing
for i=1:size(board,1)
   fprintf(fid, '%d %d %d %d %d %d %d %d %d ', board(i,:));
   fprintf(fid, '\n');
end
fclose(fid);