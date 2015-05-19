function [part,objval] = METIS_PartGraphKway(nvtxs,ncon,...
                                    xadj,adjncy,vwgt,vsize,adjwgt,...
                                    nparts,tpwgts,ubvec,options)

if(nparts>1)
    xadj = xadj-1;
    adjncy = adjncy-1;
    [objval,part] = METIS_PartGraphKway_mex(nvtxs,ncon,...
                                xadj,adjncy,vwgt,vsize,adjwgt,...
                                nparts,tpwgts,ubvec,options);
    part = part+1;
else
    objval = 0;
    part = ones(nvtxs,1);
end

end