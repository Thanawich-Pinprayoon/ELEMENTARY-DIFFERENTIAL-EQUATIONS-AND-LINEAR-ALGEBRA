function [ y_out ] = inverse_loop(A)
m = size(A, 1);
B = eye(m);
for j = 1:m-1
    for z = 2:m %permutation
        if A(j,j) == 0
            temp = A(1,:); 
            A(1,:) = A(z,:);
            A(z,:) = temp;
        end
    end
    for i = j+1:m
        temp = A(i,j)/A(j,j);
        A(i,:) = A(i,:) - A(j,:)*temp;
        B(i,:) = B(i,:) - B(j,:)*temp;
    end
end

for j = m:-1:2
    for i = j-1:-1:1
        temp = A(i,j)/A(j,j);
        A(i,:)= A(i,:) - A(j,:)*temp;
        B(i,:) = B(i,:) - B(j,:)*temp;
    end
end

for i = 1:m
    for j = 1:m
        B(i,j) = B(i,j)/A(i,i);
    end
end

y_out = B;

return