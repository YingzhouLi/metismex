addpath('../build/src','../build/mex');

N = 500;
dim = 5;
h = 2;
cut = 0.8;

data = randn(N,dim);
A = exp(-pdist2(data,data).^2/h^2);
A = sparse(A.*(abs(A)>cut));

% part = PartSparseMat(A,3);
% partW = PartSparseMatW(A,3);

[lidx,ridx,sepidx] = METIS_SepPartition(A);