function [perm,iperm] = ReorderSparseCSC(nvtxs,xadj,adjncy)
% REORDERSPARSECSC  A function reduces orderings of sparse matrices using
%   the multilevel nested dissection algorithm.
%
%   part = REORDERSPARSECSC(nvtxs,xadj,adjncy)
%
%   Parameters are explained in METIS_Parameters.
%
%   s           The weights of edges.
%
%   See also METIS_PARAMETERS, METIS_NODEND.

%   Copyright (c) 2015-2016 Yingzhou Li, Stanford University

[perm,iperm] = METIS_NodeND(nvtxs,xadj,adjncy,[],[]);

end