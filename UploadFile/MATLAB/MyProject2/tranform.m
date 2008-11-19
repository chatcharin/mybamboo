X1 = [ 312 622 170 892
       132 138 1072 1062];
 
X2 = [ 170 600 170 600
       132 132 1072 1072];
 
% create [H]
A = [];
for i = 1:4
  x1 = [X1(:,i);1];    % Get ith point in original image in homogeneous coords
  x2x = X2(1,i);       % Get x coordinate of destintion point
  x2y = X2(2,i);       % Get y coordinate of destination point
  ThisA = [ -x1', 0, 0, 0, x2x * x1' ;
            0, 0, 0, -x1', x2y * x1' ];
  A = [ A ; ThisA ];
end
 
H = reshape(null(A),3,3)';
 
 
 
% map all pixel in input image, [input_image], size MxN to temporary matrix, [tmp],  size 2 x M*N
[M,N] = size(input_image);
M
N
tmp = zeros(2,M*N);
for i = 1:M
    for j = 1:N
        tmp(1,(N*(i-1))+j) = i;
        tmp(2,(N*(i-1))+j) = j;        
    end
end
 
% convert [tmp] size 2 x M*N  to be [tmp]  size 3 x M*N by pad [1] size 1xM*N at the 3rd row
% apply X2 = H.X1
X2 = H * [ tmp ; ones(1,M*N) ];
 
% normalize [X2]
X2 = mapped(1:2,:) ./ repmat(mapped(3,:),2,1);
 
 
 
% map [X2] size 3xM*N back to [output] size MxNx3
output = zeros(M,N,3);
 
for i = 1:M
    for j = 1:N
        row = round(X2(1,(N*(i-1))+j));
        col = round(X2(2,(N*(i-1))+j));
 
        if 0 < row & row < M & 0 < col & col < N
%            [xx yy];
%            disp( 'in range' )
            output(row,col,1) = input(i,j,1);
            output(row,col,2) = input(i,j,2);
            output(row,col,3) = input(i,j,3);
        else
%            disp('out range')
        end
    end
end
 
disp('finish')