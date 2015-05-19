function [epart,npart,objval] = METIS_PartMeshDual(ne,nn,eptr,eind,...
                                    vwgt,vsize,ncommon,nparts,...
                                    tpwgts,options)

if(nparts>1)
    eptr = eptr-1;
    eind = eind-1;
    [objval,epart,npart] = METIS_PartMeshDual_mex(ne,nn,eptr,eind,...
                                vwgt,vsize,ncommon,...
                                nparts,tpwgts,options);
    epart = epart+1;
    npart = npart+1;
else
    objval = 0;
    epart = ones(ne,1);
    npart = ones(nn,1);
end

end