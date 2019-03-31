%
function [C, idx, SSE] = my_kMeansClustering(X, k, initialCentres, maxIter)
% Input
%   X : N-by-D matrix (double) of input sample data
%   k : scalar (integer) - the number of clusters
%   initialCentres : k-by-D matrix (double) of initial cluster centres
%   maxIter  : scalar (integer) - the maximum number of iterations
% Output
%   C   : k-by-D matrix (double) of cluster centres
%   idx : N-by-1 vector (integer) of cluster index table
%   SSE : (L+1)-by-1 vector (double) of sum-squared-errors

  %% If 'maxIter' argument is not given, we set by default to 500
  if nargin < 4
    maxIter = 500;
  end
  
  %% TO-DO
  [N, D] = size(X);
  C = initialCentres;
  idx_prev = zeros(1, N);
  D = zeros(k, N);
  SSE = zeros(maxIter);
  
  for i=1:maxIter
      for c = 1:k
          D(c,:) = MySqDist(X, C(c, :));
      end
      
      [Ds, idx] = min(D);
      
      for c= 1:k
          if ( sum(idx == c) == 0)
              %fprintf('k-means cluster %d is empty', c);
          else
              C(c, :) = MyMean(X(idx == c, :));
          end
      end
      
      if ( sum( abs(idx - idx_prev) ) == 0)
          break;
      end
      
      idx_prev = idx;
  
      SSE(i, 1) = sum(Ds);
%      fprintf('[%d] Iteration: ', i);
%      C
  
  SSE(i+1 , 1)= sum(Ds);
  SSE = SSE(1:i+1);
  
  idx = idx_prev';

end
