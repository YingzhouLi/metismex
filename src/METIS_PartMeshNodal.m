function [epart,npart,objval] = METIS_PartMeshNodal(ne,nn,eptr,eind,...
                                    vwgt,vsize,nparts,...
                                    tpwgts,options)
% METIS_PARTMESHNODAL  Make file for MetisMex
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
%

%   Copyright (c) 2015 Yingzhou Li, Stanford University

if(nparts>1)
    eptr = eptr-1;
    eind = eind-1;
    [objval,epart,npart] = METIS_PartMeshNodal_mex(ne,nn,eptr,eind,...
                                vwgt,vsize,nparts,tpwgts,options);
    epart = epart+1;
    npart = npart+1;
else
    objval = 0;
    epart = ones(ne,1);
    npart = ones(nn,1);
end

end