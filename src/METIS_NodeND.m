function [perm,iperm] = METIS_NodeND(nvtxs,xadj,adjncy,vwgt,options)

xadj = xadj-1;
adjncy = adjncy-1;
[perm,iperm] = METIS_NodeND_mex(nvtxs,xadj,adjncy,vwgt,options);
perm = perm+1;
iperm = iperm+1;

end