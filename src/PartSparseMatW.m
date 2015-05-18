function part = PartSparseMatW(A,nparts)

nvtxs = size(A,1);
[i,j,s] = find(A);
xadj = [1;cumsum(accumarray(j, 1))+1];
adjncy = i;
part = METIS_PartGraphKway(nvtxs,1,xadj,adjncy,abs(s),[],[],nparts,[],[],[]);

end