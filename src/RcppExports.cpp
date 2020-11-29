// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <RcppArmadillo.h>
#include <Rcpp.h>

using namespace Rcpp;

// EPPF_Dirichlet
double EPPF_Dirichlet(IntegerVector counts, double alpha);
RcppExport SEXP _BNPvegan_EPPF_Dirichlet(SEXP countsSEXP, SEXP alphaSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< IntegerVector >::type counts(countsSEXP);
    Rcpp::traits::input_parameter< double >::type alpha(alphaSEXP);
    rcpp_result_gen = Rcpp::wrap(EPPF_Dirichlet(counts, alpha));
    return rcpp_result_gen;
END_RCPP
}
// EPPF_PitmanYor
double EPPF_PitmanYor(IntegerVector counts, double alpha, double sigma);
RcppExport SEXP _BNPvegan_EPPF_PitmanYor(SEXP countsSEXP, SEXP alphaSEXP, SEXP sigmaSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< IntegerVector >::type counts(countsSEXP);
    Rcpp::traits::input_parameter< double >::type alpha(alphaSEXP);
    Rcpp::traits::input_parameter< double >::type sigma(sigmaSEXP);
    rcpp_result_gen = Rcpp::wrap(EPPF_PitmanYor(counts, alpha, sigma));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_BNPvegan_EPPF_Dirichlet", (DL_FUNC) &_BNPvegan_EPPF_Dirichlet, 2},
    {"_BNPvegan_EPPF_PitmanYor", (DL_FUNC) &_BNPvegan_EPPF_PitmanYor, 3},
    {NULL, NULL, 0}
};

RcppExport void R_init_BNPvegan(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
