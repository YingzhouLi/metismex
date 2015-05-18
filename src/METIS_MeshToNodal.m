function [xadj,adjncy] = METIS_MeshToNodal(ne,nn,eptr,eind)

eptr = eptr-1;
eind = eind-1;
[xadj,adjncy] = METIS_MeshToNodal_mex(ne,nn,eptr,eind);
xadj = xadj+1;
adjncy = adjncy+1;

end