/**************************************************************************
* METIS_SepPartition_mex.c
*
* Usage:
*
***************************************************************************/

#include <mex.h>
#include <matrix.h>
#include <metislib.h>
#include <metismex.h>

#if !defined(MX_API_VER) || ( MX_API_VER < 0x07030000 )
typedef size_t mwIndex;
typedef size_t mwSize;
#endif

#define FUNC_NAME "METIS_SepPartition_mex"

#define nvtxs_in   (prhs[0])
#define xadj_in    (prhs[1])
#define adjncy_in  (prhs[2])
#define vwgt_in    (prhs[3])
#define options_in (prhs[4])

#define lgraphidx_out   (plhs[0])
#define rgraphidx_out   (plhs[1])
#define sepidx_out      (plhs[2])
         

/**************************************************************************
* mexFunction: gateway routine for MATLAB interface.
***************************************************************************/
void mexFunction
(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    
    // Argument checking
    if (nrhs != 5)
        mexErrMsgIdAndTxt(FUNC_NAME, "Wrong input.");
    if (nlhs != 3)
        mexErrMsgIdAndTxt(FUNC_NAME, "Wrong output.");
    
    // Input and output variables
    idx_t nvtxs = (idx_t) mxGetScalar(nvtxs_in);
    idx_t *xadj; GetIdxArray(xadj_in,&xadj);
    idx_t *adjncy; GetIdxArray(adjncy_in,&adjncy);
    idx_t *vwgt; GetIdxArray(vwgt_in,&vwgt);
    idx_t options[METIS_NOPTIONS];
    GetOptions(options_in, options);
    idx_t *sepidx;
    idx_t *lgraphidx;
    idx_t *rgraphidx;
    
    // Metis main function
    idx_t i, nnvtxs=0;
    idx_t ptlgraph, ptrgraph, ptsep;
    graph_t *graph=NULL;
    ctrl_t *ctrl;
    idx_t *piperm;
    idx_t snvtxs[3];
    idx_t *where;

    /* set up malloc cleaning code and signal catchers */
    if (!gk_malloc_init()) 
        CheckReturn( METIS_ERROR_MEMORY, FUNC_NAME );

    // set up the run time parameters
    ctrl = SetupCtrl(METIS_OP_OMETIS, options, 1, 3, NULL, NULL);

    // prune the dense columns
    if (ctrl->pfactor > 0.0)
    { 
        piperm = imalloc(nvtxs, "OMETIS: piperm");

        graph = PruneGraph(ctrl, nvtxs, xadj, adjncy, vwgt,
                piperm, ctrl->pfactor);
        if (graph == NULL)
        {
            // if there was no prunning, cleanup the pfactor
            gk_free((void **)&piperm, LTERM);
            ctrl->pfactor = 0.0;
        }
        else
        {
            nnvtxs = graph->nvtxs;
            // disable compression if prunning took place
            ctrl->compress = 0;
        }
    }

    // compress the graph
    if (ctrl->compress)
        ctrl->compress = 0; 

    // if no prunning and no compression, setup the graph in the normal way.
    if (ctrl->pfactor == 0.0 && ctrl->compress == 0) 
        graph = SetupGraph(ctrl, nvtxs, 1, xadj, adjncy, vwgt, NULL, NULL);

    ASSERT(CheckGraph(graph, ctrl->numflag, 1));

    /* allocate workspace memory */
    AllocateWorkSpace(ctrl, graph);

    MlevelNodeBisectionMultiple(ctrl, graph);

    snvtxs[0] = 0;
    snvtxs[1] = 0;
    snvtxs[2] = 0;

    if (ctrl->pfactor > 0.0)
        snvtxs[2] += nvtxs-nnvtxs;

    where = graph->where;
    for (i=0; i<graph->nvtxs; i++)
        snvtxs[where[i]]++;

    lgraphidx = (idx_t*) mxCalloc (snvtxs[0], sizeof(idx_t));
    rgraphidx = (idx_t*) mxCalloc (snvtxs[1], sizeof(idx_t));
    sepidx    = (idx_t*) mxCalloc (snvtxs[2], sizeof(idx_t));

    ptlgraph = 0;
    ptrgraph = 0;
    ptsep    = 0;

    if (ctrl->pfactor > 0.0)
    {
        for (i=0; i<graph->nvtxs; i++)
            if (where[i] == 0)
                lgraphidx[ptlgraph++] = piperm[i];
            else if (where[i] == 1)
                rgraphidx[ptrgraph++] = piperm[i];
            else
                sepidx[ptsep++] = piperm[i];

        for (i=nnvtxs; i<nvtxs; i++)
            sepidx[ptsep++] = piperm[i];

        gk_free((void **)&piperm, LTERM);
    }
    else
    {
        for (i=0; i<graph->nvtxs; i++)
            if (where[i] == 0)
                lgraphidx[ptlgraph++] = i;
            else if (where[i] == 1)
                rgraphidx[ptrgraph++] = i;
            else
                sepidx[ptsep++] = i;
    }

    /* clean up */
    FreeCtrl(&ctrl);

    // Output
    lgraphidx_out = mxCreateDoubleMatrix(1,ptlgraph,mxREAL);
    mxSetData(lgraphidx_out,mxMalloc(sizeof(double)*ptlgraph));
    double *lgraphidx_out_pr = mxGetPr(lgraphidx_out);
    for(idx_t i=0; i<ptlgraph; i++)
        lgraphidx_out_pr[i] = (double) lgraphidx[i];
    rgraphidx_out = mxCreateDoubleMatrix(1,ptrgraph,mxREAL);
    mxSetData(rgraphidx_out,mxMalloc(sizeof(double)*ptrgraph));
    double *rgraphidx_out_pr = mxGetPr(rgraphidx_out);
    for(idx_t i=0; i<ptrgraph; i++)
        rgraphidx_out_pr[i] = (double) rgraphidx[i];
    sepidx_out = mxCreateDoubleMatrix(1,ptsep,mxREAL);
    mxSetData(sepidx_out,mxMalloc(sizeof(double)*ptsep));
    double *sepidx_out_pr = mxGetPr(sepidx_out);
    for(idx_t i=0; i<ptsep; i++)
        sepidx_out_pr[i] = (double) sepidx[i];
}
