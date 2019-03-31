%
%
function [EVecs, EVals, CumVar, MinDims] = task1_3(X)
% Input:
%  X : M-by-D data matrix (double)
% Output:
%  EVecs, Evals: same as in comp_pca.m
%  CumVar  : D-by-1 vector (double) of cumulative variance
%  MinDims : 4-by-1 vector (integer) of the minimum number of PCA dimensions
%            to cover 70%, 80%, 90%, and 95% of the total variance.

[EVecs, EVals] = comp_pca(X);
CumVar = cumsum(EVals);

[evals_rows, evals_cols] = size(EVals);

MinDims = zeros(4,1);

for i=1:evals_rows
    
    curr_cumvar_ratio = CumVar(i) / CumVar(evals_rows);
    
    if (curr_cumvar_ratio < 0.8) && (curr_cumvar_ratio >=0.7)
        MinDims(1,1) = i;
    elseif (curr_cumvar_ratio < 0.9) && (curr_cumvar_ratio >=0.8)
        MinDims(2,1) = i;
    elseif (curr_cumvar_ratio < 0.95) && (curr_cumvar_ratio >=0.9)
        MinDims(3,1) = i;
    elseif (curr_cumvar_ratio >=0.95)
        MinDims(4,1) = i;
    end

end
