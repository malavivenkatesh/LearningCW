%
%
function task1_6(MAT_ClusterCentres)
% Input:
%  MAT_ClusterCentres : file name of the MAT file that contains cluster centres C.
%       
% 
temp = load(MAT_ClusterCentres, 'C');
C = temp.C;
[k, D] = size(C);
result = zeros(28, 28, 1, k);

for i=1:k
    result(:, :, 1, i) = reshape(C(i, :), 28, 28, 1)';
end
montage(result);
  
end
