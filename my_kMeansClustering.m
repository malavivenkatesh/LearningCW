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
  C_res = zeros(k, N);
  idx_prev = zeros(1, N);
  if k == 1

  end
  
  for i=1:maxIter
      for c = 1:k
          C_res(c,:) = MySqDist(X, initialCentres(c, :));
      end
      
      [Ds, idx] = min(D);
      
      for c= 1:k
          if ( sum(idx == c) == 0)
              %fprintf('k-means cluster %d is empty', c);
          else
              initialCentres(c, :) = MyMean(X(idx == c));
          end
      end
      
      if ( sum( abs(idx - idx_prev) ) == 0)
          break;
      end
      idx_prev = idx;

  end
  
  
  
  C = C_res;
  idx = idx_prev';
  
  SSE = sum(Ds);
  
end
