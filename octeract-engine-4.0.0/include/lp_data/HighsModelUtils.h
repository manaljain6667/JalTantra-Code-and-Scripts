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
/**@file lp_data/HighsModelUtils.h
 * @brief Class-independent utilities for HiGHS
 */
#ifndef LP_DATA_HIGHSMODELUTILS_H_
#define LP_DATA_HIGHSMODELUTILS_H_

#include "HConfig.h"
#include "Highs.h"
#include "lp_data/HighsStatus.h"

HighsStatus assessMatrixDimensions(const HighsLogOptions& log_options,
                                   const std::string matrix_name,
                                   const HighsInt num_vec,
                                   const vector<HighsInt>& matrix_start,
                                   const vector<HighsInt>& matrix_index,
                                   const vector<double>& matrix_value);

HighsStatus assessMatrix(const HighsLogOptions& log_options,
                         const std::string matrix_name, const HighsInt vec_dim,
                         const HighsInt num_vec, vector<HighsInt>& matrix_start,
                         vector<HighsInt>& matrix_index,
                         vector<double>& matrix_value,
                         const double small_matrix_value,
                         const double large_matrix_value);

// Analyse lower and upper bounds of a model
void analyseModelBounds(const HighsLogOptions& log_options, const char* message,
                        HighsInt numBd, const std::vector<double>& lower,
                        const std::vector<double>& upper);
void writeModelBoundSolution(
    FILE* file, const bool columns, const HighsInt dim,
    const std::vector<double>& lower, const std::vector<double>& upper,
    const std::vector<std::string>& names, const bool have_primal,
    const std::vector<double>& primal, const bool have_dual,
    const std::vector<double>& dual, const bool have_basis,
    const std::vector<HighsBasisStatus>& status,
    const HighsVarType* integrality = NULL);
void writeModelSolution(FILE* file, const HighsLp& lp,
                        const HighsSolution& solution, const HighsInfo& info);
bool namesWithSpaces(const HighsInt num_name,
                     const std::vector<std::string>& names,
                     const bool report = false);
HighsInt maxNameLength(const HighsInt num_name,
                       const std::vector<std::string>& names);
HighsStatus normaliseNames(const HighsLogOptions& log_options,
                           const std::string name_type, const HighsInt num_name,
                           std::vector<std::string>& names,
                           HighsInt& max_name_length);

HighsBasisStatus checkedVarHighsNonbasicStatus(
    const HighsBasisStatus ideal_status, const double lower,
    const double upper);

std::string utilModelStatusToString(const HighsModelStatus model_status);

std::string utilSolutionStatusToString(const HighsInt solution_status);

std::string utilBasisStatusToString(const HighsBasisStatus basis_status);

std::string utilBasisValidityToString(const HighsInt basis_validity);

void zeroHighsIterationCounts(HighsIterationCounts& iteration_counts);

HighsStatus highsStatusFromHighsModelStatus(HighsModelStatus model_status);

std::string statusToString(const HighsBasisStatus status, const double lower,
                           const double upper);
std::string typeToString(const HighsVarType type);
#endif
