function part = PartSparseMat(A,nparts,flag)
% PARTSPARSEMAT  A function partition a adjacency matrix in sparse matrix
%   format into k parts.
%
%   part = PartSparseMat(A,nparts,flag)
%
%   Most parameters are explained in METIS_Parameters.
%
%   A           Adjacency matrix, the value of any non-zero entries is
%               ignored.
%   flag = 1    This is the default value, graph multilevel recursive k-way
%               partitioning is applied.
%   flag = 0    Graph multilevel recursive bisection partitioning is
%               applied.
%
%   See also METIS_PARAMETERS, METIS_PARTGRAPHKWAY,
%   METIS_PARTGRAPHRECURSIVE.

%   Copyright (c) 2015-2016 Yingzhou Li, Stanford University

if nargin < 3
    flag = 1;
end

g = METIS_Graph(A);
if flag
    part = METIS_PartGraphKway(g.nvtxs,1,g.xadj,g.adjncy,[],[],[],nparts,[],[],[]);
else
    part = METIS_PartGraphRecursive(g.nvtxs,1,g.xadj,g.adjncy,[],[],[],nparts,...
                                    [],[],[]);
end

end
