%
%
function task1_1(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8) 

[rw cw] = size(X);
result = zeros(28, 28, 1, 10);
for label=0:9
    count = 1;
    k = 1;
    while count < 11
    if Y(k) == label        
        result(:, :,1, count) = reshape(X(k,:), 28, 28)';

        count = count + 1;
    end
    k = k + 1;
    end
    montage(result);
end

end
