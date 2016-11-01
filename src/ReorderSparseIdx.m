function [perm,iperm] = ReorderSparseIdx(nvtxs,i,j)
% REORDERSPARSEIDX   A function reduces orderings of sparse matrices using
%   the multilevel nested dissection algorithm.
%
%   [perm,iperm] = REORDERSPARSEIDX(nvtxs,i,j)
%
%   Most parameters are explained in METIS_Parameters.
%
%   i           Row index set.
%   j           Column index set.
%
%   See also METIS_PARAMETERS, METIS_NODEND.

%   Copyright (c) 2015-2016 Yingzhou Li, Stanford University

xadj = [1;cumsum(accumarray(j, 1))+1];
adjncy = i;
[perm,iperm] = METIS_NodeND(nvtxs,xadj,adjncy,[],[]);

end