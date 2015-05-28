function part = PartSparseMatW(A,nparts,flag)
% PARTSPARSEMATW  A function partition a weighted graph in sparse matrix format
% into k parts.
%
%   part = PartSparseMatW(A,nparts,flag)
%
%   Most parameters are explained in METIS_Parameters.
%
%   A           Weighted graph matrix, the value of any non-zero entries is the
%               edge weight.
%   flag = 1    This is the default value, graph multilevel recursive k-way
%               partitioning is applied.
%   flag = 0    Graph multilevel recursive bisection partitioning is applied.
%
%   See also METIS_PARAMETERS, METIS_PARTGRAPHKWAY, METIS_PARTGRAPHRECURSIVE.

%   Copyright (c) 2015 Yingzhou Li, Stanford University

if nargin < 3
    flag = 1;
end

nvtxs = size(A,1);
[i,j,s] = find(A);
xadj = [1;cumsum(accumarray(j, 1))+1];
adjncy = i;
if flag
    part = METIS_PartGraphKway(nvtxs,1,xadj,adjncy,s,[],[],nparts,[],[],[]);
else
    part = METIS_PartGraphRecursive(nvtxs,1,xadj,adjncy,s,[],[],nparts,[],[],[]);
end

end
