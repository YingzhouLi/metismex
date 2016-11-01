function METIS_OPTIONS
%METIS_OPTIONS Introduction to option structure used in MetisMex.
%   The option structure appear in input.
%
%   options.METIS_OPTION_PTYPE      Specifies the partitioning method.
%           METIS_PTYPE_RB(0)       Multilevel recursive bisectioning.
%           METIS_PTYPE_KWAY(1)     Multilevel k-way partitioning.
%
%   options.METIS_OPTION_OBJTYPE    Specifies the type of objective.
%           METIS_OBJTYPE_CUT(0)    Edge-cut minimization.
%           METIS_OBJTYPE_VOL(1)    Total communication volume
%                                   minimization.
%
%   options.METIS_OPTION_CTYPE      Specifies the matching scheme to be
%                                   used during coarsening.
%           METIS_CTYPE_RM(0)       Random matching.
%           METIS_CTYPE_SHEM(1)     Sorted heavy-edge matching.
%
%   options.METIS_OPTION_IPTYPE     Determines the algorithm used during
%                                   initial partitioning.
%           METIS_IPTYPE_GROW(0)    Grows a bisection using a greedy
%                                   strategy.
%           METIS_IPTYPE_RANDOM(1)  Computes a bisection at random followed
%                                   by a refinement.
%           METIS_IPTYPE_EDGE(2)    Derives a separator from an edge cut.
%           METIS_IPTYPE_NODE(3)    Grows a bisection using a greedy
%                                   node-based strategy.
%
%   options.METIS_OPTION_RTYPE      Determines the algorithm used for
%                                   refinement.
%           METIS_RTYPE_FM(0)       FM-based cut refinement.
%           METIS_RTYPE_GREEDY(1)   Greedy-based cut and volume refinement.
%           METIS_RTYPE_SEP2SIDED(2)Two-sided node FM refinement.
%           METIS_RTYPE_SEP1SIDED(3)One-sided node FM refinement.
%
%   options.METIS_OPTION_NCUTS      Specifies the number of different
%                                   partitionings that it will compute. The
%                                   final partitioning is the one that
%                                   achieves the best edgecut or
%                                   communication volume. Default is 1.
%
%   options.METIS_OPTION_NSEPS      Specifies the number of different
%                                   separators that it will compute at each
%                                   level of nested dissection. The final
%                                   separator that is used is the smallest
%                                   one. Default is 1.
%
%   options.METIS_OPTION_NITER      Specifies the number of iterations for
%                                   the refinement algorithms at each stage
%                                   of the uncoarsening process. Default is
%                                   10.
%
%   options.METIS_OPTION_SEED       Specifies the seed for the random
%                                   number generator.
%
%   options.METIS_OPTION_MINCONN    Specifies that the partitioning
%                                   routines should try to minimize the
%                                   maximum degree of the subdomain graph,
%                                   i.e., the graph in which each partition
%                                   is a node, and edges connect subdomains
%                                   with a shared interface.
%           0                       Performs a 2-hop matching.
%           1                       Does not perform a 2-hop matching.
%
%   options.METIS_OPTION_NO2HOP     Specifies that the coarsening will not
%                                   perform any 2-hop matchings when the
%                                   standard matching approach fails to
%                                   sufficiently coarsen the graph. The
%                                   2-hop matching is very effective for
%                                   graphs with power-law degree
%                                   distributions.
%           0                       Performs a 2-hop matching.
%           1                       Does not perform a 2-hop matching.
%
%   options.METIS_OPTION_CONFIG     Specifies that the partitioning
%                                   routines should try to produce
%                                   partitions that are contiguous. Note
%                                   that if the input graph is not
%                                   connected this option is ignored.
%           0                       Does not force contiguous partitions.
%           1                       Forces contiguous partitions.
%
%   options.METIS_OPTION_COMPRESS   Specifies that the graph should be
%                                   compressed by combining together
%                                   vertices that have identical adjacency
%                                   lists.
%           0                       Does not try to compress the graph.
%           1                       Tries to compress the graph.
%
%   options.METIS_OPTION_CCORDER    Specifies if the connected components
%                                   of the graph should first be identified
%                                   and ordered separately.
%           0                       Does not identify the connected
%                                   components.
%           1                       Identifies the connected components.
%
%   options.METIS_OPTION_PFACTOR    Specifies the minimum degree of the
%                                   vertices that will be ordered last. If
%                                   the specified value is x>0, then any
%                                   vertices with a degree greater than
%                                   0.1*x*(average degree) are removed from
%                                   the graph, an ordering of the rest of
%                                   the vertices is computed, and an
%                                   overall ordering is computed by
%                                   ordering the removed vertices at the
%                                   end of the overall ordering. For
%                                   example if x=40, and the average degree
%                                   is 5, then the algorithm will remove
%                                   all vertices with degree greater than
%                                   20. The vertices that are removed are
%                                   ordered last (i.e., they are
%                                   automatically placed in the top-level
%                                   separator). Good values are often in
%                                   the range of 60 to 200 (i.e., 6 to 20
%                                   times more than the average). Default
%                                   value is 0, indicating that no vertices
%                                   are removed.
%                                   Used to control whether or not the
%                                   ordering algorithm should remove any
%                                   vertices with high degree (i.e., dense
%                                   colmuns). This is particularly helpfull
%                                   for certain classes of LP matrices, in
%                                   which there a few vertices that are
%                                   connected to many other vertices. By
%                                   removing these vertices prior to
%                                   ordering, the quality and the amount of
%                                   time required to do the ordering
%                                   improves.
%
%   options.METIS_OPTION_UFACTOR    Specifies the maximum allowed load
%                                   imbalance among the partitions. A value
%                                   of x indicates that the allowed load
%                                   imbalance is (1+x)/1000. The load
%                                   imbalance for the jth constraint is
%                                   defined to be max_i(w(j,i)/t(j,i)),
%                                   where w(j,i) is the fraction of the
%                                   overall weight of the jth constraint
%                                   that is assigned to the ith partition
%                                   and t(j,i) is the desired target weight
%                                   of the jth constraint for the ith
%                                   partition (i.e., that specifies via
%                                   -tpwgts). For recursive bisectioning,
%                                   the default value is 1 (i.e., load
%                                   imbalance of 1.001) and for k-way
%                                   partitioning, the default value is 30
%                                   (i.e., load imbalance of 1.03).
%
%   options.METIS_OPTION_DBGLVL     Specifies the amount of
%                                   progress/debugging information will be
%                                   printed during the execution of the
%                                   algorithms. The default value is 0 (no
%                                   debugging/progress information). A
%                                   non-zero value can be supplied that is
%                                   obtained by a bit-wise OR of the
%                                   following values.
%           METIS_DBG_INFO(1)       Prints various diagnostic messages.
%           METIS_DBG_TIME(2)       Performs timing analysis.
%           METIS_DBG_COARSEN(4)    Displays various statistics during
%                                   coarsening.
%           METIS_DBG_REFINE(8)     Displays various statistics during
%                                   refinement.
%           METIS_DBG_IPART(16)     Displays various statistics during
%                                   initial partitioning.
%           METIS_DBG_MOVEINFO(32)  Displays detailed information about
%                                   vertex moves during refinement.
%           METIS_DBG_SEPINFO(64)   Displays information about vertex
%                                   separators.
%           METIS_DBG_CONNINFO(128) Displays information related to the
%                                   minimization of subdomain connectivity.
%           METIS_DBG_CONTIGINFO(256)
%                                   Displays information related to the
%                                   elimination of connected components.
%
%
%   Example:
%       options.METIS_OPTION_NSEPS = 10;
%       options.METIS_OPTION_UFACTOR = 100;
%       options.METIS_OPTION_OBJTYPE = 0;
%
%
%   This introduction of the option structure is copied from the manual of
%   METIS.
%
%   See also METIS_PARAMETERS.
%
%   References
%   [1] METIS, A Software Package for Partitioning Unstructured Graphs,
%       Partitioning Meshes, and Computing Fill-Reducing Orderings of
%       Sparse Matrices, Version 5.1.0, George Karypis, University of
%       Minnesota, March 30, 2013.
%

end
