/*************************************************************************
* METIS_NodeND_mex.c
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

#define FUNC_NAME "METIS_NodeND_mex"

#define nvtxs_in   (prhs[0])
#define xadj_in    (prhs[1])
#define adjncy_in  (prhs[2])
#define vwgt_in    (prhs[3])
#define options_in (prhs[4])

#define perm_out   (plhs[0])
#define iperm_out  (plhs[1])
         

/**************************************************************************
* mexFunction: gateway routine for MATLAB interface.
***************************************************************************/
void mexFunction
(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    
    // Argument checking
    if (nrhs != 5)
        mexErrMsgIdAndTxt(FUNC_NAME, "Wrong input.");
    if (nlhs != 2)
        mexErrMsgIdAndTxt(FUNC_NAME, "Wrong output.");
    
    // Input and output variables
    idx_t nvtxs = (idx_t) mxGetScalar(nvtxs_in);
    idx_t *xadj; GetIdxArray(xadj_in,&xadj);
    idx_t *adjncy; GetIdxArray(adjncy_in,&adjncy);
    idx_t *vwgt; GetIdxArray(vwgt_in,&vwgt);
    idx_t options[METIS_NOPTIONS];
    GetOptions(options_in, options);
    idx_t *perm = (idx_t*) mxCalloc (nvtxs, sizeof(idx_t));
    idx_t *iperm = (idx_t*) mxCalloc (nvtxs, sizeof(idx_t));
    
    // Metis main function
    int info = METIS_NodeND( &nvtxs, xadj, adjncy, vwgt, options,
                    perm, iperm);
    CheckReturn(info, FUNC_NAME);
    
    // Output
    perm_out = mxCreateDoubleMatrix(1,nvtxs,mxREAL);
    mxSetData(perm_out,mxMalloc(sizeof(double)*nvtxs));
    double *perm_out_pr = mxGetPr(perm_out);
    for(idx_t i=0; i<nvtxs; i++)
        perm_out_pr[i] = (double) perm[i];
    iperm_out = mxCreateDoubleMatrix(1,nvtxs,mxREAL);
    mxSetData(iperm_out,mxMalloc(sizeof(double)*nvtxs));
    double *iperm_out_pr = mxGetPr(iperm_out);
    for(idx_t i=0; i<nvtxs; i++)
        iperm_out_pr[i] = (double) iperm[i];
}
