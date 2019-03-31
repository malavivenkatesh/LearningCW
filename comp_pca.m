function [EVecs, EVals] = comp_pca(X)
% Input: 
%   X:  N x D matrix (double)
% Output: 
%   EVecs: D-by-D matrix (double) contains all eigenvectors as columns
%       NB: follow the Task 1.3 specifications on eigenvectors.
%   EVals:
%       Eigenvalues in descending order, D x 1 vector (double)
%   (Note that the i-th columns of Evecs should corresponds to the i-th element in EVals)
  %% TO-DO
  
    %Calculating the mean mean
    x_mean = MyMean(X);
    
    %Subtracting the mean from every value in X
    X = bsxfun(@minus, X, x_mean);
    
    %calculating the covariance
    N = length(X);
    covar_m = 1/(N)*(X' * X);
    
    %using eig with a now square matrix.
    [PC, V] = eig(covar_m);
    
    %Diagonalising the eigenvalues and sorting the vectors in descending
    %order
    V = diag(V);
    [tmp, ridx] = sort(V, 1, 'descend');
    
    %Sorting the matrices in descending order using the index from the sort
    %function
    V = V(ridx);
    PC = PC(:,ridx);
    
    [pc_rows, pc_cols] = size(PC);
    for i=1:pc_cols
        if PC(1,i) < 0
            PC(:, i) = - PC(:, i);
        end
    end
    
    EVecs = PC;
    EVals = V;

end

