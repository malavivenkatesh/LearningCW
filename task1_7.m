%
%
function Dmap = task1_7(MAT_ClusterCentres, MAT_M, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  MAT_ClusterCentres: MAT filename of cluster centre matrix
%  MAT_M     : MAT filename of mean vectors of (K+1)-by-D, where K is
%              the number of classes (which is 10 for the MNIST data)
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec    : 1-by-D vector (double) to specify the position of the plane
%  nbins     : scalar (integer) to specify the number of bins for each PCA axis
% Output
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.
load(MAT_ClusterCentres);
[K, cl] = size(C);

load(MAT_M);
meanvector = M(11, :);

load(MAT_evecs);
load(MAT_evals);

%standard deviations of x and y axis
xstan = sqrt(EVals(1));
ystan = sqrt(EVals(2));

pca1 = EVecs(:, 1);
pca2 = EVecs(:, 2);
pcas = [pca1, pca2];
m_proj = (C - posVec)*pcas;
mean_proj = meanvector*pcas;


xrange = meanvector(1);
yrange = meanvector(2);


Xplot = linspace(xrange - 5*xstan, xrange + 5*xstan, nbins)';
Yplot = linspace(yrange - 5*ystan, yrange + 5*ystan, nbins)';
[Xv, Yv] = meshgrid(Xplot, Yplot);
gridX = [Xv(:), Yv(:)]; 

%X_back_proj = (V*(gridX(1))' + posVec')';
%Y_back_proj = (V*(gridX(2))' + posVec')';

Dmap = length(Xv(:));
for i = 1:length(gridX)  
dists = MySqDist(m_proj, gridX(i, :))'; % Compute distances
[d I] = sort(dists, 'ascend');
Dmap(i) = I(1);
end

figure;

[CC,h] = contourf(Xplot(:), Yplot(:), reshape(Dmap, length(Xplot), length(Yplot)));
set(h,'LineColor','none');
%colormap(cmap); 
hold on;

% Plot the scatter plots grouped by their classes
%scatters = gscatter(A(:,1), A(:,2), C, [0,0,0], 'o', 4);
% Fill in the color of each point according to the class labels.

%for n = 1:length(scatters)
%set(scatters(n), 'MarkerFaceColor', cmap(n,:));
%end
			  
end
