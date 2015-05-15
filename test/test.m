addpath('../build/src','../build/mex');

N = 15;
xadj = [0 2 5 8 11 13 16 20 24 28 31 33 36 39 42 44]+1;
adjncy = [1 5 0 2 6 1 3 7 2 4 8 3 9 0 6 10 1 5 7 11 2 6 8 12 3 7 9 13 4 ...
            8 14 5 11 6 10 12 7 11 13 8 12 14 9 13]+1;
partRecursive = METIS_PartGraphRecursive(N,1,xadj,adjncy,[],[],[],2,[],[],[]);
partKway = METIS_PartGraphKway(N,1,xadj,adjncy,[],[],[],3,[],[],[]);