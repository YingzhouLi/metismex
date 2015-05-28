function part = PartSparseCSCW(nvtxs,xadj,adjncy,s,nparts,flag)
% PARTSPARSECSCW  A function partition a weighted graph in CSC format into k
% parts.
%
%   part = PartSparseCSCW(nvtxs,xadj,adjncy,s,nparts,flag)
%
%   Parameters are explained in METIS_Parameters.
%
%   s           The weights of edges.
%   flag = 1    This is the default value, graph multilevel recursive k-way
%               partitioning is applied.
%   flag = 0    Graph multilevel recursive bisection partitioning is applied.
%
%   See also METIS_PARAMETERS, METIS_PARTGRAPHKWAY, METIS_PARTGRAPHRECURSIVE.

%   Copyright (c) 2015 Yingzhou Li, Stanford University

if nargin < 6
    flag = 1;
end

if flag
    part = METIS_PartGraphKway(nvtxs,1,xadj,adjncy,s,[],[],nparts,[],[],[]);
else
    part = METIS_PartGraphRecursive(nvtxs,1,xadj,adjncy,s,[],[],nparts,...
                                    [],[],[]);
end

end
