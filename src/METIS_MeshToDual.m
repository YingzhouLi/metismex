function [xadj,adjncy] = METIS_MeshToDual(ne,nn,eptr,eind,ncommon)

eptr = eptr-1;
eind = eind-1;
[xadj,adjncy] = METIS_MeshToDual_mex(ne,nn,eptr,eind,ncommon);
xadj = xadj+1;
adjncy = adjncy+1;

end