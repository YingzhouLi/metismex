function [xadj,adjncy] = METIS_MeshToDual(ne,nn,eptr,eind,ncommon)
% METIS_MESHTODUAL  Matlab interface to the mex file of
% METIS_MeshToDual.
%
%   MAKE, MAKE(0) produce the mex files for METIS under 'build'
%   folder.
%
%   MAKE(1) produces the mex files for METIS under 'build' folder
%   and install MetisMex under the userpath/methismex. The path to
%   installed MetisMex will be added in 'startup.m' such that the
%   MetisMex will be included automatically..
%
%   MAKE(-1) uninstall MetisMex and delete all the files under
%   'build' folder.

%   Copyright (c) 2015 Yingzhou Li, Stanford University

eptr = eptr-1;
eind = eind-1;
[xadj,adjncy] = METIS_MeshToDual_mex(ne,nn,eptr,eind,ncommon);
xadj = xadj+1;
adjncy = adjncy+1;

end
