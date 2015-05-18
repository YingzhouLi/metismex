addpath('../build/src','../build/mex');

N = 1000;
dim = 5;
h = 2;
cut = 0.5;

data = randn(N,dim);
A = exp(-pdist2(data,data).^2/h^2);
A = sparse(A.*(abs(A)>cut));

part = PartSparseMat(A,3);
partW = PartSparseMatW(A,3);