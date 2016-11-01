function METIS_Parameters
%METIS_PARAMETERS Introduction to parameters used in MetisMex.
%   The parameters appear in both input and output, the definitions
%   remain the same.
%
%   nvtxs       The number of vertices in the graph.
%
%   ncon        The number of balancing constrints. It should be at least
%               1.
%
%   ne          The number of elements in the mesh.
%
%   nn          The number of nodes in the mesh.
%
%   xadj        The adjacency structure of the graph. xadj is an array of
%               size n+1 where n is the number of vertices in the graph.
%               xadj(i) and xadj(i+1) are the staring and ending index
%               of the adjacency list of vertex i in adjncy array.
%
%   adjncy      The adjacency structure of the graph. adjncy is an array of
%               size 2m, where m is the number of undirected edges in the
%               graph. adjncy stores the edge list of vertices.
%
%               For detailed description of xadj, adjncy, please read
%               Section 5.5 in [1].
%
%   eptr        The adjacency structure of the mesh. eptr is similar to
%               xadj.
%
%   eind        The adjacency structure of the mesh. eind is similar to
%               adjncy.
%
%   vwgt        The weights of the vertices. Empty ([]) is allowed.
%
%   vsize       The size of the vertices for computing the total
%               communication volume. Empty ([]) is allowed.
%
%   adjwgt      The weights of edges. Empty ([]) is allowed.
%
%   ncommon     Specifies the number of common nodes that two elements must
%               have in order to put an edge between them in the dual
%               graph. Given two elements e1 and e2, containing n1 and n2
%               nodes, respectively, then an edge will connect the vertices
%               in the dual graph corresponding to e1 and e2 if the number
%               of common nodes between them is greater than or equal to
%               min(ncommon, n1-1, n2-1). The default value is 1,
%               indicating that two elements will be connected via an edge
%               as long as they share one node. However, this will tend to
%               create too many edges (increasing the memory and time
%               requirements of the partitioning). The user should select
%               higher values that are better suited for the element type
%               of the mesh that wants to partition. For example, for
%               tetrahedron meshes, ncommon should be 3, which creates an
%               edge between two tets when they share a triangular face
%               (i.e., 3 nodes).
%
%   nparts      The number of parts to partition the graph.
%
%   tpwgts      This is an array of size nparts*ncon that specifies the
%               desired weight for each partition and constraint. The
%               target partition weight for the ith partition and jth
%               constraint is specified at tpwgts(i*ncon+j) (the numbering
%               for both partitions and constraints starts from 0). For
%               each constraint, the sum of the tpwgts entries must be 1.0
%               (i.e., sum_i(tpwgts(i*ncon+j))=1.0). Empty ([]) is allowed
%               to indicate that the graph should be equally divided among
%               the partitions.
%
%   ubvec       This is an array of size ncon that specifies the allowed
%               load imbalance tolerance for each constraint. For the ith
%               partition and jth constraint, the allowed weight is the
%               ubvec(j)*tpwgts(i*ncon+j) fraction of the jth's constraint
%               total weight. The load imbalances must be greater than 1.0.
%               Empty ([]) is allowed to indicate that the load imbalance
%               tolerance for each constraint should be 1.001 (for ncon=1)
%               or 1.01 (for ncon>1).
%
%   options     This is the array of options. For detailed information,
%               readers are referred to METIS_OPTIONS.
%
%   objval      Upon successful completion, this variable stores the
%               edge-cut or the total communication valume of the
%               partitioning solution. The value returned depends on the
%               partitioning's objective function.
%
%   part        This is a vector of size nvtxs that upon successful
%               completion stores the partition vector of the graph.
%
%   epart       This is a vector of size ne that upon successful completion
%               stores the partition vector for the elements of the mesh.
%
%   npart       This is a vector of size nn that upon successful completion
%               stores the partition vector of the nodes of the mesh.
%
%   perm        This is a vector of size nvtxs. Upon successful completion,
%               it stores the fill-reducing permutation.
%
%   iperm       This is a vector of size nvtxs. Upon successful completion,
%               it stores the fill-reducing inverse-permutation.
%
%   This introduction of the parameters is copied from the manual of METIS.
%
%   See also METIS_OPTIONS.
%
%   References
%   [1] METIS, A Software Package for Partitioning Unstructured Graphs,
%       Partitioning Meshes, and Computing Fill-Reducing Orderings of
%       Sparse Matrices, Version 5.1.0, George Karypis, University of
%       Minnesota, March 30, 2013.
%

end
