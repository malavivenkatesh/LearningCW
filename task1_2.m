%
%
function M = task1_2(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
% Output:
%  M : (K+1)-by-D mean vector matrix (double)
%      Note that M(K+1,:) is the mean vector of X.

[rw, cl] = size(X);
sums = zeros(11, 784);
counts = zeros(11, 1);
mean = zeros(11, 784);
result = zeros(28, 28, 1, 11);

for label=0:9
    count = 0;
    for i=1:rw
        if Y(i) == label
            count = count + 1;
            sums((label + 1), :) = (sums((label+1), :) + X(i, :));
            counts((label + 1), 1) = count;
            result(:, :, 1, (label + 1)) = result(:, :, 1, (label + 1)) + reshape(X(i, :), 28, 28, 1)';
        end
    end
end

for i=1:10
    mean(i,:) = (sums(i, :) ./ counts(i, 1));
    result(:, :, 1, i) = result(:, :, 1, i) ./ counts(i, 1);
end

mean(11, :) = sum(X) ./ rw;
result(:, :, 1, 11) = reshape(mean(11, :), 28, 28, 1)';

M = mean;

montage(result);

end
