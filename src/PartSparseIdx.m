function part = PartSparseIdx(nvtxs,i,j,nparts,flag)
% PARTSPARSEIDX  A function partition a adjacency matrix in triple tuple
%   format into k parts.
%
%   part = PartSparseIdx(nvtxs,i,j,nparts,flag)
%
%   Most parameters are explained in METIS_Parameters.
%
%   i           Row index set.
%   j           Column index set.
%   flag = 1    This is the default value, graph multilevel recursive k-way
%               partitioning is applied.
%   flag = 0    Graph multilevel recursive bisection partitioning is
%               applied.
%
%   See also METIS_PARAMETERS, METIS_PARTGRAPHKWAY,
%   METIS_PARTGRAPHRECURSIVE.

%   Copyright (c) 2015-2016 Yingzhou Li, Stanford University

if nargin < 6
    flag = 1;
end

xadj = [1;cumsum(accumarray(j, 1))+1];
adjncy = i;
if flag
    part = METIS_PartGraphKway(nvtxs,1,xadj,adjncy,[],[],[],nparts,[],[],[]);
else
    part = METIS_PartGraphRecursive(nvtxs,1,xadj,adjncy,[],[],[],nparts,[],...
                                    [],[]);
end

end
