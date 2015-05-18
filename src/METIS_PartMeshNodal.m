function [epart,npart,objval] = METIS_PartMeshNodal(ne,nn,eptr,eind,...
                                    vwgt,vsize,nparts,...
                                    tpwgts,options)

eptr = eptr-1;
eind = eind-1;
[objval,epart,npart] = METIS_PartMeshNodal_mex(ne,nn,eptr,eind,...
                            vwgt,vsize,nparts,tpwgts,options);
epart = epart+1;
npart = npart+1;

end