function [xadj,adjncy] = METIS_MeshToNodal(ne,nn,eptr,eind)
% METIS_MESHTONODAL  Matlab interface to the mex file of METIS_MeshToNodal.
%
%   [xadj,adjncy] = METIS_MESHTONODAL(ne,nn,eptr,eind)
%
%   This function is used to generate the nodal graph of a mesh.
%
%   Parameters are explained in METIS_Parameters.
%
%   See also METIS_PARAMETERS.

%   Copyright (c) 2015-2016 Yingzhou Li, Stanford University

eptr = eptr-1;
eind = eind-1;
[xadj,adjncy] = METIS_MeshToNodal_mex(ne,nn,eptr,eind);
xadj = xadj+1;
adjncy = adjncy+1;

end
