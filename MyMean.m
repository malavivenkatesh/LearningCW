function [M] = My_Mean(X)
%My own mean function for the column mean
[rw cl] = size(X);
sums = sum(X);
mean = sums ./ rw;

M = mean;
end

