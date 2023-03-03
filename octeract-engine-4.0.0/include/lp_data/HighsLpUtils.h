/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*                                                                       */
/*    This file is part of the HiGHS linear optimization suite           */
/*                                                                       */
/*    Written and engineered 2008-2021 at the University of Edinburgh    */
/*                                                                       */
/*    Available as open-source under the MIT License                     */
/*                                                                       */
/*    Authors: Julian Hall, Ivet Galabova, Qi Huangfu, Leona Gottwald    */
/*    and Michael Feldmeier                                              */
/*                                                                       */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/**@file lp_data/HighsLpUtils.h
 * @brief Class-independent utilities for HiGHS
 */
#ifndef LP_DATA_HIGHSLPUTILS_H_
#define LP_DATA_HIGHSLPUTILS_H_

#include <vector>

#include "lp_data/HConst.h"
#include "lp_data/HighsInfo.h"
#include "lp_data/HighsStatus.h"
#include "util/HighsUtils.h"

class HighsLp;
struct HighsScale;
struct HighsBasis;
struct HighsSolution;
class HighsOptions;

using std::vector;

void writeBasisFile(FILE*& file, const HighsBasis& basis);

HighsStatus readBasisFile(const HighsLogOptions& log_options, HighsBasis& basis,
                          const std::string filename);
HighsStatus readBasisStream(const HighsLogOptions& log_options,
                            HighsBasis& basis, std::ifstream& in_file);

// Methods taking HighsLp as an argument
HighsStatus assessLp(HighsLp& lp, const HighsOptions& options);

HighsStatus assessLpDimensions(const HighsOptions& options, const HighsLp& lp);

HighsStatus assessCosts(const HighsOptions& options, const HighsInt ml_col_os,
                        const HighsIndexCollection& index_collection,
                        vector<double>& cost, const double infinite_cost);

HighsStatus assessBounds(const HighsOptions& options, const char* type,
                         const HighsInt ml_ix_os,
                         const HighsIndexCollection& index_collection,
                         vector<double>& lower, vector<double>& upper,
                         const double infinite_bound);

HighsStatus cleanBounds(const HighsOptions& options, HighsLp& lp);

HighsStatus assessIntegrality(HighsLp& lp, const HighsOptions& options);

HighsStatus applyScalingToLp(const HighsLogOptions& log_options, HighsLp& lp,
                             const HighsScale& scale);

HighsStatus applyScalingToLpColCost(
    const HighsLogOptions& log_options, HighsLp& lp,
    const vector<double>& colScale,
    const HighsIndexCollection& index_collection);

HighsStatus applyScalingToLpColBounds(
    const HighsLogOptions& log_options, HighsLp& lp,
    const vector<double>& colScale,
    const HighsIndexCollection& index_collection);

HighsStatus applyScalingToLpRowBounds(
    const HighsLogOptions& log_options, HighsLp& lp,
    const vector<double>& rowScale,
    const HighsIndexCollection& index_collection);

HighsStatus applyScalingToLpMatrix(
    const HighsLogOptions& log_options, HighsLp& lp, const double* colScale,
    const double* rowScale, const HighsInt from_col, const HighsInt to_col,
    const HighsInt from_row, const HighsInt to_row);

void applyRowScalingToMatrix(const vector<double>& rowScale,
                             const HighsInt numCol,
                             const vector<HighsInt>& Astart,
                             const vector<HighsInt>& Aindex,
                             vector<double>& Avalue);

void colScaleMatrix(const HighsInt max_scale_factor_exponent, double* colScale,
                    const HighsInt numCol, const vector<HighsInt>& Astart,
                    const vector<HighsInt>& Aindex, vector<double>& Avalue);

HighsStatus applyScalingToLpCol(const HighsLogOptions& log_options, HighsLp& lp,
                                const HighsInt col, const double colScale);

HighsStatus applyScalingToLpRow(const HighsLogOptions& log_options, HighsLp& lp,
                                const HighsInt row, const double rowScale);

void appendToMatrix(HighsLp& lp, const HighsInt num_vec,
                    const HighsInt num_new_vec, const HighsInt num_new_nz,
                    const HighsInt* XAstart, const HighsInt* XAindex,
                    const double* XAvalue);

HighsStatus appendColsToLpVectors(HighsLp& lp, const HighsInt num_new_col,
                                  const vector<double>& colCost,
                                  const vector<double>& colLower,
                                  const vector<double>& colUpper);

HighsStatus appendColsToLpMatrix(HighsLp& lp, const HighsInt num_new_col,
                                 const HighsInt num_new_nz,
                                 const HighsInt* XAstart,
                                 const HighsInt* XAindex,
                                 const double* XAvalue);

HighsStatus appendRowsToLpVectors(HighsLp& lp, const HighsInt num_new_row,
                                  const vector<double>& rowLower,
                                  const vector<double>& rowUpper);

HighsStatus appendRowsToLpMatrix(HighsLp& lp, const HighsInt num_new_row,
                                 const HighsInt num_new_nz,
                                 const HighsInt* XARstart,
                                 const HighsInt* XARindex,
                                 const double* XARvalue);

HighsStatus deleteLpCols(const HighsLogOptions& log_options, HighsLp& lp,
                         const HighsIndexCollection& index_collection);

HighsStatus deleteColsFromLpVectors(
    const HighsLogOptions& log_options, HighsLp& lp, HighsInt& new_num_col,
    const HighsIndexCollection& index_collection);

HighsStatus deleteColsFromLpMatrix(
    const HighsLogOptions& log_options, HighsLp& lp,
    const HighsIndexCollection& index_collection);

HighsStatus deleteLpRows(const HighsLogOptions& log_options, HighsLp& lp,
                         const HighsIndexCollection& index_collection);

HighsStatus deleteRowsFromLpVectors(
    const HighsLogOptions& log_options, HighsLp& lp, HighsInt& new_num_row,
    const HighsIndexCollection& index_collection);

HighsStatus deleteRowsFromLpMatrix(
    const HighsLogOptions& log_options, HighsLp& lp,
    const HighsIndexCollection& index_collection);

HighsStatus changeLpMatrixCoefficient(HighsLp& lp, const HighsInt row,
                                      const HighsInt col,
                                      const double new_value);

HighsStatus changeLpIntegrality(const HighsLogOptions& log_options, HighsLp& lp,
                                const HighsIndexCollection& index_collection,
                                const vector<HighsVarType>& new_integrality);

HighsStatus changeLpCosts(const HighsLogOptions& log_options, HighsLp& lp,
                          const HighsIndexCollection& index_collection,
                          const vector<double>& new_col_cost);

HighsStatus changeLpColBounds(const HighsLogOptions& log_options, HighsLp& lp,
                              const HighsIndexCollection& index_collection,
                              const vector<double>& new_col_lower,
                              const vector<double>& new_col_upper);

HighsStatus changeLpRowBounds(const HighsLogOptions& log_options, HighsLp& lp,
                              const HighsIndexCollection& index_collection,
                              const vector<double>& new_row_lower,
                              const vector<double>& new_row_upper);

HighsStatus changeBounds(const HighsLogOptions& log_options,
                         vector<double>& lower, vector<double>& upper,
                         const HighsIndexCollection& index_collection,
                         const vector<double>& new_lower,
                         const vector<double>& new_upper);

/**
 * @brief Report the data of an LP
 */
void reportLp(const HighsLogOptions& log_options,
              const HighsLp& lp,  //!< LP whose data are to be reported
              const HighsLogType report_level = HighsLogType::kInfo
              //!< INFO => scalar [dimensions];
              //!< DETAILED => vector[costs/bounds];
              //!< VERBOSE => vector+matrix
);
/**
 * @brief Report the brief data of an LP
 */
void reportLpBrief(const HighsLogOptions& log_options,
                   const HighsLp& lp  //!< LP whose data are to be reported
);
/**
 * @brief Report the data of an LP
 */
void reportLpDimensions(const HighsLogOptions& log_options,
                        const HighsLp& lp  //!< LP whose data are to be reported
);
/**
 * @brief Report the data of an LP
 */
void reportLpObjSense(const HighsLogOptions& log_options,
                      const HighsLp& lp  //!< LP whose data are to be reported
);
/**
 * @brief Report the data of an LP
 */
void reportLpColVectors(const HighsLogOptions& log_options,
                        const HighsLp& lp  //!< LP whose data are to be reported
);
/**
 * @brief Report the data of an LP
 */
void reportLpRowVectors(const HighsLogOptions& log_options,
                        const HighsLp& lp  //!< LP whose data are to be reported
);
/**
 * @brief Report the data of an LP
 */
void reportLpColMatrix(const HighsLogOptions& log_options,
                       const HighsLp& lp  //!< LP whose data are to be reported
);

void reportMatrix(const HighsLogOptions& log_options, const std::string message,
                  const HighsInt num_col, const HighsInt num_nz,
                  const HighsInt* start, const HighsInt* index,
                  const double* value);

// Get the number of integer-valued columns in the LP
HighsInt getNumInt(const HighsLp& lp);

// Get the costs for a contiguous set of columns
HighsStatus getLpCosts(const HighsLp& lp, const HighsInt from_col,
                       const HighsInt to_col, double* XcolCost);

// Get the bounds for a contiguous set of columns
HighsStatus getLpColBounds(const HighsLp& lp, const HighsInt from_col,
                           const HighsInt to_col, double* XcolLower,
                           double* XcolUpper);

// Get the bounds for a contiguous set of rows
HighsStatus getLpRowBounds(const HighsLp& lp, const HighsInt from_row,
                           const HighsInt to_row, double* XrowLower,
                           double* XrowUpper);

HighsStatus getLpMatrixCoefficient(const HighsLp& lp, const HighsInt row,
                                   const HighsInt col, double* val);
// Analyse the data in an LP problem
void analyseLp(const HighsLogOptions& log_options, const HighsLp& lp,
               const std::string message);

// Analyse the scaling and data in a scaled LP problem
void analyseScaledLp(const HighsLogOptions& log_options,
                     const HighsScale& scale, const HighsLp& scaled_lp);

void writeSolutionFile(FILE* file, const HighsLp& lp, const HighsBasis& basis,
                       const HighsSolution& solution, const HighsInfo& info,
                       const HighsModelStatus model_status,
                       const HighsInt style);

HighsStatus readSolutionFile(const std::string filename,
                             const HighsOptions& options, const HighsLp& lp,
                             HighsBasis& basis, HighsSolution& solution,
                             const HighsInt style);

void checkLpSolutionFeasibility(const HighsOptions& options, const HighsLp& lp,
                                const HighsSolution& solution);

HighsStatus calculateRowValues(const HighsLp& lp, HighsSolution& solution);
HighsStatus calculateColDuals(const HighsLp& lp, HighsSolution& solution);

bool isBoundInfeasible(const HighsLogOptions& log_options, const HighsLp& lp);

bool isColDataNull(const HighsLogOptions& log_options,
                   const double* usr_col_cost, const double* usr_col_lower,
                   const double* usr_col_upper);
bool isRowDataNull(const HighsLogOptions& log_options,
                   const double* usr_row_lower, const double* usr_row_upper);
bool isMatrixDataNull(const HighsLogOptions& log_options,
                      const HighsInt* usr_matrix_start,
                      const HighsInt* usr_matrix_index,
                      const double* usr_matrix_value);

void reportPresolveReductions(const HighsLogOptions& log_options,
                              const HighsLp& lp, const HighsLp& presolve_lp);

void reportPresolveReductions(const HighsLogOptions& log_options,
                              const HighsLp& lp, const bool presolve_to_empty);

bool isLessInfeasibleDSECandidate(const HighsLogOptions& log_options,
                                  const HighsLp& lp);

HighsStatus setFormat(
    HighsLp& lp, const MatrixFormat desired_format = MatrixFormat::kColwise);
void ensureColWise(HighsLp& lp);
void ensureRowWise(HighsLp& lp);

HighsLp withoutSemiVariables(const HighsLp& lp);

void removeRowsOfCountOne(const HighsLogOptions& log_options, HighsLp& lp);
#endif  // LP_DATA_HIGHSLPUTILS_H_
