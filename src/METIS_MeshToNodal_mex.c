/**************************************************************************
* METIS_MeshToNodal_mex.c
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

#define FUNC_NAME "METIS_MeshToNodal_mex"

#define ne_in      (prhs[0])
#define nn_in      (prhs[1])
#define eptr_in    (prhs[2])
#define eind_in    (prhs[3])

#define xadj_out   (plhs[0])
#define adjncy_out (plhs[1])
         

/**************************************************************************
* mexFunction: gateway routine for MATLAB interface.
***************************************************************************/
void mexFunction
(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    
    // Argument checking
    if (nrhs != 4)
        mexErrMsgIdAndTxt(FUNC_NAME, "Wrong input.");
    if (nlhs != 2)
        mexErrMsgIdAndTxt(FUNC_NAME, "Wrong output.");
    
    // Input and output variables
    idx_t ne = (idx_t) mxGetScalar(ne_in);
    idx_t nn = (idx_t) mxGetScalar(nn_in);
    idx_t *eptr; GetIdxArray(eptr_in,&eptr);
    idx_t *eind; GetIdxArray(eind_in,&eind);
    idx_t numflag = 0;
    idx_t *xadj = NULL;
    idx_t *adjncy = NULL;
    
    // Metis main function
    int info = METIS_MeshToNodal( &ne, &nn, eptr, eind, &numflag,
                    &xadj, &adjncy);
    CheckReturn(info, FUNC_NAME);
    
    // Output
    idx_t nvtxs = (idx_t) (sizeof(xadj)/sizeof(idx_t));
    xadj_out = mxCreateDoubleMatrix(1,nvtxs+1,mxREAL);
    mxSetData(xadj_out,mxMalloc(sizeof(double)*(nvtxs+1)));
    double *xadj_out_pr = mxGetPr(xadj_out);
    for(idx_t i=0; i<nvtxs+1; i++)
        xadj_out_pr[i] = (double) xadj[i];
    idx_t n = (idx_t) xadj[nvtxs];
    adjncy_out = mxCreateDoubleMatrix(1,n,mxREAL);
    mxSetData(adjncy_out,mxMalloc(sizeof(double)*n));
    double *adjncy_out_pr = mxGetPr(adjncy_out);
    for(idx_t i=0; i<n; i++)
        adjncy_out_pr[i] = (double) adjncy[i];
}
