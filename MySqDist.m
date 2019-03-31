function [SqDist] = MySqDist(u,v)
%Squared Euclidean Distance between 2 points

 SqDist = sum(bsxfun(@minus, u, v).^2, 2)';
 
end

