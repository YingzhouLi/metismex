function [xadj,adjncy] = METIS_MeshToDual(ne,nn,eptr,eind,ncommon)
% METIS_MESHTODUAL  Matlab interface to the mex file of METIS_MeshToDual.
%
%   [xadj,adjncy] = METIS_MESHTODUAL(ne,nn,eptr,eind,ncommon)
%
%   This function is used to generate the dual graph of a mesh.
%
%   Parameters are explained in METIS_Parameters.
%
%   See also METIS_PARAMETERS.

%   Copyright (c) 2015-2016 Yingzhou Li, Stanford University

eptr = eptr-1;
eind = eind-1;
[xadj,adjncy] = METIS_MeshToDual_mex(ne,nn,eptr,eind,ncommon);
xadj = xadj+1;
adjncy = adjncy+1;

end
