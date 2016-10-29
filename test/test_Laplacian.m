addpath('../build/src','../build/mex');

n = 32;

%% 2D Laplacian with Dirichlet boundary condition
TOneDim = sparse( [1:n 1:n-1 2:n], ...
    [1:n 2:n 1:n-1], ...
    [-2*ones(1,n),ones(1,n-1),ones(1,n-1)],n,n);
T = (kron(TOneDim,eye(n)) + kron(eye(n),TOneDim));

[lidx,ridx,sepidx] = METIS_SepPartition(T);

figure(1)
[X,Y] = ndgrid(1:n,1:n);
hold all;
scatter(X(lidx),Y(lidx),5,'green','filled');
scatter(X(sepidx),Y(sepidx),5,'blue','filled');
scatter(X(ridx),Y(ridx),5,'cyan','filled');

%% 2D Laplacian with periodic boundary condition
TOneDim = sparse( [1:n 1:n 1:n], ...
    [1:n [2:n 1] [n 1:n-1]], ...
    [-2*ones(1,n),ones(1,n),ones(1,n)],n,n);
T = (kron(TOneDim,eye(n)) + kron(eye(n),TOneDim));

[lidx,ridx,sepidx] = METIS_SepPartition(T);

figure(2)
[X,Y] = ndgrid(1:n,1:n);
hold all;
scatter(X(lidx),Y(lidx),5,'green','filled');
scatter(X(sepidx),Y(sepidx),5,'blue','filled');
scatter(X(ridx),Y(ridx),5,'cyan','filled');