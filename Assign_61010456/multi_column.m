function [y_out] = multi_column(A,B)
m = size(A,1);
n = size(B,2);
C = zeros(m,n);
tic
for i = 1:n
    C(:,i) = A*B(:,i) + C(:,i);
end
toc
y_out = C;
end