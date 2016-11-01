/*************************************************************************
* METIS_PartMeshDual_mex.c
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

#define FUNC_NAME "METIS_PartMeshDual_mex"

#define ne_in   (prhs[0])
#define nn_in    (prhs[1])
#define eptr_in    (prhs[2])
#define eind_in  (prhs[3])
#define vwgt_in    (prhs[4])
#define vsize_in   (prhs[5])
#define ncommon_in  (prhs[6])
#define nparts_in  (prhs[7])
#define tpwgts_in  (prhs[8])
#define options_in (prhs[9])

#define objval_out (plhs[0])
#define epart_out   (plhs[1])
#define npart_out   (plhs[2])
         

/**************************************************************************
* mexFunction: gateway routine for MATLAB interface.
***************************************************************************/
void mexFunction
(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    
    // Argument checking
    if (nrhs != 10)
        mexErrMsgIdAndTxt(FUNC_NAME, "Wrong input.");
    if (nlhs != 3)
        mexErrMsgIdAndTxt(FUNC_NAME, "Wrong output.");
    
    // Input and output variables
    idx_t ne = (idx_t) mxGetScalar(ne_in);
    idx_t nn = (idx_t) mxGetScalar(nn_in);
    idx_t *eptr; GetIdxArray(eptr_in,&eptr);
    idx_t *eind; GetIdxArray(eind_in,&eind);
    idx_t *vwgt; GetIdxArray(vwgt_in,&vwgt);
    idx_t *vsize; GetIdxArray(vsize_in,&vsize);
    idx_t ncommon = (idx_t) mxGetScalar(ncommon_in);
    idx_t nparts = (idx_t) mxGetScalar(nparts_in);
    real_t *tpwgts; GetRealArray(tpwgts_in,&tpwgts);
    idx_t options[METIS_NOPTIONS];
    GetOptions(options_in, options);
    idx_t objval;
    idx_t *epart = (idx_t*) mxCalloc (ne, sizeof(idx_t));
    idx_t *npart = (idx_t*) mxCalloc (nn, sizeof(idx_t));
    
    // Metis main function
    int info = METIS_PartMeshDual( &ne, &nn, eptr, eind, vwgt, vsize,
                    &ncommon, &nparts, tpwgts, options, &objval,
                    epart, npart);
    CheckReturn(info, FUNC_NAME);
    
    // Output
    objval_out = mxCreateDoubleScalar( (double) objval );
    epart_out = mxCreateDoubleMatrix(1,ne,mxREAL);
    mxSetData(epart_out,mxMalloc(sizeof(double)*ne));
    double *epart_out_pr = mxGetPr(epart_out);
    for(idx_t i=0; i<ne; i++)
        epart_out_pr[i] = (double) epart[i];
    npart_out = mxCreateDoubleMatrix(1,nn,mxREAL);
    mxSetData(npart_out,mxMalloc(sizeof(double)*nn));
    double *npart_out_pr = mxGetPr(npart_out);
    for(idx_t i=0; i<nn; i++)
        npart_out_pr[i] = (double) npart[i];
}
