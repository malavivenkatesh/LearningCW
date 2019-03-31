%
%
function task1_5(X, Ks)
% Input:
%  X  : M-by-D data matrix (double)
%  Ks : 1-by-L vector (integer) of the numbers of nearest neighbours
[M, D] = size(X);
[rw, L] = size(Ks);

for i=1:L
    tic
    k = Ks(i);
    initials = zeros(k, D);
    for j=1:k
        
        initials(j, :) = X(j, :);
        [C, idx, SSE] = my_kMeansClustering(X, k, initials);
        
%        k_string = char(k);
%        base_name = save_base{1};
%        c_filename = strcat('task1_5_c_', k_string, '.mat');
%        idx_filename = sprintf('task1_5_idx_%d.mat', k);
%        sse_filename = sprintf('task1_5_sse_%d.mat', k);
%        save(c_filename,  C);
%        save (idx_filename, idx);
%        save (sse_filename, SSE);
    end
    toc
end

end
