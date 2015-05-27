#ifndef METISMEX_H
#define METISMEX_H

void GetIdxArray(const mxArray *mex_array, idx_t **c_array)
{
    if(mxIsEmpty(mex_array))
    {
        *c_array = NULL;
        return;
    }
    mxClassID category = mxGetClassID(mex_array);
    mwSize totN = mxGetNumberOfElements(mex_array);
    *c_array = (idx_t*) mxCalloc (totN, sizeof(idx_t));
    switch (category)  {
        case mxINT8_CLASS:
        {
            signed char *pr;
            pr = (signed char *)mxGetData(mex_array);
            for( idx_t i=0; i<totN; i++ )
                (*c_array)[i] = (idx_t) pr[i];
            break;
        }
        case mxUINT8_CLASS:
        {
            unsigned char *pr;
            pr = (unsigned char *)mxGetData(mex_array);
            for( idx_t i=0; i<totN; i++ )
                (*c_array)[i] = (idx_t) pr[i];
            break;
        }
        case mxINT16_CLASS:
        {
            short int *pr;
            pr = (short int *)mxGetData(mex_array);
            for( idx_t i=0; i<totN; i++ )
                (*c_array)[i] = (idx_t) pr[i];
            break;
        }
        case mxUINT16_CLASS:
        {
            unsigned short int *pr;
            pr = (unsigned short int *)mxGetData(mex_array);
            for( idx_t i=0; i<totN; i++ )
                (*c_array)[i] = (idx_t) pr[i];
            break;
        }
        case mxINT32_CLASS:
        {
            int *pr;
            pr = (int *)mxGetData(mex_array);
            for( idx_t i=0; i<totN; i++ )
                (*c_array)[i] = (idx_t) pr[i];
            break;
        }
        case mxUINT32_CLASS:
        {
            unsigned int *pr;
            pr = (unsigned int *)mxGetData(mex_array);
            for( idx_t i=0; i<totN; i++ )
                (*c_array)[i] = (idx_t) pr[i];
            break;
        }
        case mxINT64_CLASS:
        {
            int64_T *pr;
            pr = (int64_T *)mxGetData(mex_array);
            for( idx_t i=0; i<totN; i++ )
                (*c_array)[i] = (idx_t) pr[i];
            break;
        }
        case mxUINT64_CLASS:
        {
            uint64_T *pr;
            pr = (uint64_T *)mxGetData(mex_array);
            for( idx_t i=0; i<totN; i++ )
                (*c_array)[i] = (idx_t) pr[i];
            break;
        }
        case mxSINGLE_CLASS:
        {
            float *pr;
            pr = (float *)mxGetData(mex_array);
            for( idx_t i=0; i<totN; i++ )
                (*c_array)[i] = (idx_t) pr[i];
            break;
        }
        case mxDOUBLE_CLASS:
        {
            double *pr;
            pr = (double *)mxGetData(mex_array);
            for( idx_t i=0; i<totN; i++ )
                (*c_array)[i] = (idx_t) pr[i];
            break;
        }
        default: break;
    }
}

void GetRealArray(const mxArray *mex_array, real_t **c_array)
{
    if(mxIsEmpty(mex_array))
    {
        *c_array = NULL;
        return;
    }
    mxClassID category = mxGetClassID(mex_array);
    mwSize totN = mxGetNumberOfElements(mex_array);
    *c_array = (real_t*) mxCalloc (totN, sizeof(real_t));
    switch (category)  {
        case mxSINGLE_CLASS:
        {
            float *pr;
            pr = (float *)mxGetData(mex_array);
            for( idx_t i=0; i<totN; i++ )
                (*c_array)[i] = (real_t) pr[i];
            break;
        }
        case mxDOUBLE_CLASS:
        {
            double *pr;
            pr = (double *)mxGetData(mex_array);
            for( idx_t i=0; i<totN; i++ )
                (*c_array)[i] = (real_t) pr[i];
            break;
        }
        default: break;
    }
}

void CheckReturn(int rval, const char *func_name) {
    switch (rval) {
        case METIS_OK:
            return;
        case METIS_ERROR_INPUT:
            mexErrMsgIdAndTxt(func_name, "Metis input error.");
            break;
        case METIS_ERROR_MEMORY:
            mexErrMsgIdAndTxt(func_name, "Metis memory error.");
            break;
        default:
            mexErrMsgIdAndTxt(func_name, "Unknown Metis error.");
            break;
    }
}

void GetOptions(const mxArray *mxoptions, idx_t *options) {
    METIS_SetDefaultOptions(options);
    if(!mxIsStruct(mxoptions))
        return;
    mxArray *val;
    val = mxGetField(mxoptions, (mwIndex) 0, "METIS_OPTION_PTYPE");
    if(val!=NULL)
        options[METIS_OPTION_PTYPE] = mxGetScalar(val);
    val = mxGetField(mxoptions, (mwIndex) 0, "METIS_OPTION_OBJTYPE");
    if(val!=NULL)
        options[METIS_OPTION_OBJTYPE] = mxGetScalar(val);
    val = mxGetField(mxoptions, (mwIndex) 0, "METIS_OPTION_CTYPE");
    if(val!=NULL)
        options[METIS_OPTION_CTYPE] = mxGetScalar(val);
    val = mxGetField(mxoptions, (mwIndex) 0, "METIS_OPTION_IPTYPE");
    if(val!=NULL)
        options[METIS_OPTION_IPTYPE] = mxGetScalar(val);
    val = mxGetField(mxoptions, (mwIndex) 0, "METIS_OPTION_RTYPE");
    if(val!=NULL)
        options[METIS_OPTION_RTYPE] = mxGetScalar(val);
    val = mxGetField(mxoptions, (mwIndex) 0, "METIS_OPTION_NCUTS");
    if(val!=NULL)
        options[METIS_OPTION_NCUTS] = mxGetScalar(val);
    val = mxGetField(mxoptions, (mwIndex) 0, "METIS_OPTION_NSEPS");
    if(val!=NULL)
        options[METIS_OPTION_NSEPS] = mxGetScalar(val);
    val = mxGetField(mxoptions, (mwIndex) 0, "METIS_OPTION_NUMBERING");
    if(val!=NULL)
        options[METIS_OPTION_NUMBERING] = mxGetScalar(val);
    val = mxGetField(mxoptions, (mwIndex) 0, "METIS_OPTION_NITER");
    if(val!=NULL)
        options[METIS_OPTION_NITER] = mxGetScalar(val);
    val = mxGetField(mxoptions, (mwIndex) 0, "METIS_OPTION_SEED");
    if(val!=NULL)
        options[METIS_OPTION_SEED] = mxGetScalar(val);
    val = mxGetField(mxoptions, (mwIndex) 0, "METIS_OPTION_MINCONN");
    if(val!=NULL)
        options[METIS_OPTION_MINCONN] = mxGetScalar(val);
    val = mxGetField(mxoptions, (mwIndex) 0, "METIS_OPTION_NO2HOP");
    if(val!=NULL)
        options[METIS_OPTION_NO2HOP] = mxGetScalar(val);
    val = mxGetField(mxoptions, (mwIndex) 0, "METIS_OPTION_CONTIG");
    if(val!=NULL)
        options[METIS_OPTION_CONTIG] = mxGetScalar(val);
    val = mxGetField(mxoptions, (mwIndex) 0, "METIS_OPTION_COMPRESS");
    if(val!=NULL)
        options[METIS_OPTION_COMPRESS] = mxGetScalar(val);
    val = mxGetField(mxoptions, (mwIndex) 0, "METIS_OPTION_CCORDER");
    if(val!=NULL)
        options[METIS_OPTION_CCORDER] = mxGetScalar(val);
    val = mxGetField(mxoptions, (mwIndex) 0, "METIS_OPTION_PFACTOR");
    if(val!=NULL)
        options[METIS_OPTION_PFACTOR] = mxGetScalar(val);
    val = mxGetField(mxoptions, (mwIndex) 0, "METIS_OPTION_UFACTOR");
    if(val!=NULL)
        options[METIS_OPTION_UFACTOR] = mxGetScalar(val);
    val = mxGetField(mxoptions, (mwIndex) 0, "METIS_OPTION_DBGLVL");
    if(val!=NULL)
        options[METIS_OPTION_DBGLVL] = mxGetScalar(val);
}
#endif //METISMEX_H
