function [part,objval] = METIS_PartGraphRecursive(nvtxs,ncon,...
                                    xadj,adjncy,vwgt,vsize,adjwgt,...
                                    nparts,tpwgts,ubvec,options)
% METIS_PARTGRAPHRECURSIVE  Matlab interface to the mex file of
%   METIS_PartGraphRecursive.
%
%   [part,objval] = METIS_PartGraphRecursive(nvtxs,ncon,xadj,adjncy,vwgt,
%                                            vsize,adjwgt,nparts,tpwgts,
%                                            ubvec,options)
%
%   This function is used to partition a graph into k parts using
%   multilevel recursive bisection partitioning.
%
%   Parameters are explained in METIS_Parameters and options are explained
%   in METIS_Options.
%
%   See also METIS_PARAMETERS, METIS_OPTIONS.

%   Copyright (c) 2015-2016 Yingzhou Li, Stanford University

if(nparts>1)
    xadj = xadj-1;
    adjncy = adjncy-1;
    [objval,part] = METIS_PartGraphRecursive_mex(nvtxs,ncon,...
                                xadj,adjncy,vwgt,vsize,adjwgt,...
                                nparts,tpwgts,ubvec,options);
    part = part+1;
else
    objval = 0;
    part = ones(nvtxs,1);
end

end
