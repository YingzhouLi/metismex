function [epart,npart,objval] = METIS_PartMeshNodal(ne,nn,eptr,eind,...
                                    vwgt,vsize,nparts,...
                                    tpwgts,options)
% METIS_PARTMESHNODAL  Matlab interface to the mex file of
%   METIS_PartMeshNodal.
%
%   [epart,npart,objval] = METIS_PartMeshNodal(ne,nn,eptr,eind,vwgt,vsize,
%                                              nparts,tpwgts,options)
%
%   This function is used to partition a mesh into k parts based on a
%   partitioning of the mesh's nodal graph.
%
%   Parameters are explained in METIS_Parameters and options are explained
%   in METIS_Options.
%
%   See also METIS_PARAMETERS, METIS_OPTIONS.

%   Copyright (c) 2015-2016 Yingzhou Li, Stanford University

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
