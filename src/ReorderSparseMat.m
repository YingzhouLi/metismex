function [perm,iperm] = ReorderSparseMat(A,options)
% REORDERSPARSEMAT  A function reduces orderings of sparse matrices using
%   the multilevel nested dissection algorithm.
%
%   [perm,iperm] = REORDERSPARSEMAT(A,options)
%
%   Most parameters are explained in METIS_Parameters.
%
%   A    Adjacency matrix, the value of any non-zero entries is ignored.
%
%   See also METIS_PARAMETERS, METIS_NODEND.

%   Copyright (c) 2015-2020 Yingzhou Li

if nargin < 2
    options = [];
end

g = METIS_Graph(A);
[perm,iperm] = METIS_NodeND(g.nvtxs,g.xadj,g.adjncy,[],options);

end
