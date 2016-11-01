function [perm,iperm] = METIS_NodeND(nvtxs,xadj,adjncy,vwgt,options)
% METIS_NODEND  Matlab interface to the mex file of METIS_NodeND.
%
%   [perm,iperm] = METIS_NodeND(nvtxs,xadj,adjncy,vwgt,options)
%
%   This function computes fill reducing orderings of sparse matrices using
%   the multilevel nested dissection algorithm.
%
%   Parameters are explained in METIS_Parameters and options are explained
%   in METIS_Options.
%
%   See also METIS_PARAMETERS, METIS_OPTIONS.

%   Copyright (c) 2015-2016 Yingzhou Li, Stanford University

xadj = xadj-1;
adjncy = adjncy-1;
[perm,iperm] = METIS_NodeND_mex(nvtxs,xadj,adjncy,vwgt,options);
perm = perm+1;
iperm = iperm+1;

end
