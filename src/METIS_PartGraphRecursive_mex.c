/*************************************************************************
* METIS_PartGraphRecursive_mex.c
*
* Usage:
*
***************************************************************************/

#include <mex.h>
#include <matrix.h>
#include <metis.h>
#include <metismex.h>

#if !defined(MX_API_VER) || ( MX_API_VER < 0x07030000 )
typedef size_t mwIndex;
typedef size_t mwSize;
#endif

#define FUNC_NAME "METIS_PartGraphRecursive_mex"

#define nvtxs_in   (prhs[0])
#define ncon_in    (prhs[1])
#define xadj_in    (prhs[2])
#define adjncy_in  (prhs[3])
#define vwgt_in    (prhs[4])
#define vsize_in   (prhs[5])
#define adjwgt_in  (prhs[6])
#define nparts_in  (prhs[7])
#define tpwgts_in  (prhs[8])
#define ubvec_in   (prhs[9])
#define options_in (prhs[10])

#define objval_out (plhs[0])
#define part_out   (plhs[1])
         

/**************************************************************************
* mexFunction: gateway routine for MATLAB interface.
***************************************************************************/
void mexFunction
(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    
    // Argument checking
    if (nrhs != 11)
        mexErrMsgIdAndTxt(FUNC_NAME, "Wrong input.");
    if (nlhs != 2)
        mexErrMsgIdAndTxt(FUNC_NAME, "Wrong output.");
    
    // Input and output variables
    idx_t nvtxs = (idx_t) mxGetScalar(nvtxs_in);
    idx_t ncon = (idx_t) mxGetScalar(ncon_in);
    idx_t *xadj; GetIdxArray(xadj_in,&xadj);
    idx_t *adjncy; GetIdxArray(adjncy_in,&adjncy);
    idx_t *vwgt; GetIdxArray(vwgt_in,&vwgt);
    idx_t *vsize; GetIdxArray(vsize_in,&vsize);
    idx_t *adjwgt; GetIdxArray(adjwgt_in,&adjwgt);
    idx_t nparts = (idx_t) mxGetScalar(nparts_in);
    real_t *tpwgts; GetRealArray(tpwgts_in,&tpwgts);
    real_t *ubvec; GetRealArray(ubvec_in,&ubvec);
    idx_t options[METIS_NOPTIONS];
    GetOptions(options_in, options);
    idx_t objval;
    idx_t *part = (idx_t*) mxCalloc (nvtxs, sizeof(idx_t));
    
    // Metis main function
    int info = METIS_PartGraphRecursive( &nvtxs, &ncon, xadj, adjncy,
                    vwgt, vsize, adjwgt, &nparts, tpwgts,
                    ubvec, options, &objval, part);
    CheckReturn(info, FUNC_NAME);
    
    // Output
    objval_out = mxCreateDoubleScalar( (double) objval );
    part_out = mxCreateDoubleMatrix(1,nvtxs,mxREAL);
    mxSetData(part_out,mxMalloc(sizeof(double)*nvtxs));
    double *part_out_pr = mxGetPr(part_out);
    for(idx_t i=0; i<nvtxs; i++)
        part_out_pr[i] = (double) part[i];
}
