%
%
function task1_4(EVecs)
% Input:
%  Evecs : the same format as in comp_pca.m
%
EVecs = EVecs';

[rw cw] = size(EVecs);
result = zeros(28, 28, 1, 12);
for i=1:10  
   result(:, :,1, i) = reshape(EVecs(i,:), 28, 28,1)';
end

result = mat2gray(result);
%montage(result, 'DisplayRange', [-0.5, 0.5]);


    %filename  = sprintf('task1_4_imgs.pdf');
    M = montage(result);
    %saveas(gcf, filename);
end

