function part = PartSparseCSC(nvtxs,i,j,nparts)

xadj = [1;cumsum(accumarray(j, 1))+1];
adjncy = i;
part = METIS_PartGraphKway(nvtxs,1,xadj,adjncy,[],[],[],nparts,[],[],[]);

end