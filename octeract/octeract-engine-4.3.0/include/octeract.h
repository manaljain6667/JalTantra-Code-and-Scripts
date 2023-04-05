#ifndef OCTERACT_API_MODEL_H
#define OCTERACT_API_MODEL_H

#include <limits>
#include <vector>
#include <map>
#include <unordered_map>
#include <memory>
#include <iostream>

namespace octeract {

enum class ObjSense : unsigned int {
    Minimize = 0,
    Maximize,
};

enum class ConSense : unsigned int {
    EqualTo = 0,
    LessThan,
    GreaterThan,
};

enum class VarType : unsigned int {
    Continuous = 0,
    Binary,
    Integer,
};

namespace api {
class Model;
}

class  Model {
public:
    Model();
    ~Model();
    Model(const Model &);
    Model(Model &&) noexcept;
    Model &operator=(const Model &);
    Model &operator=(Model &&) noexcept;

    void add_variable(const std::string &name,
                      double lb = -std::numeric_limits<double>::max(),
                      double ub = std::numeric_limits<double>::max(),
                      VarType type = VarType::Continuous);

    double get_variable_lb(const std::string &name);
    double get_variable_ub(const std::string &name);
    void fix_variable(const std::string &name, double value);
    void fix_variables(const std::map<std::string, double> &fix_values);
    std::vector<std::string> get_variable_names();
    std::unordered_map<std::string, std::string> get_variable_map();

    void add_constraint(const std::string &name, const std::string &con_str);
    void add_constraint(const std::string &con_str);
    void add_constraint(const std::string &name, const std::string &fun_str, double lb, double ub);
    void add_constraint(const std::string &fun_str, double lb, double ub);

    std::string classify_problem();
    void clear();
    void detect_bounds();
    bool detect_problem_convexity();
    bool is_problem_convex();

    std::vector<std::string> get_binary_constraint_names();
    std::vector<std::string> get_binary_variable_names();

    std::unordered_map<std::string, double> get_bound_multipliers();

    double get_constant_part_of_constraint(const std::string &constraint_name);
    double get_constant_part_of_objective();

    double get_constraint_lb(const std::string &name);
    std::string get_constraint_lhs(const std::string &name);
    std::unordered_map<std::string, double> get_constraint_multipliers();
    std::vector<std::string> get_constraint_names();
    double get_constraint_rhs(const std::string &name);
    ConSense get_constraint_type(const std::string &name);
    double get_constraint_ub(const std::string &name);
    std::vector<std::string> get_constraint_variables(const std::string &name);

    std::vector<std::string> get_continuous_variable_names();

    double get_linear_coefficient_of_constraint(const std::string &constraint_name, const std::string &var_name);
    double get_linear_coefficient_of_objective(const std::string &var_name);
    std::unordered_map<std::string, double> get_linear_coefficients_of_constraint(const std::string &constraint_name);
    std::unordered_map<std::string, double> get_linear_coefficients_of_objective();
    std::vector<std::string> get_linear_constraint_names();
    std::vector<std::string> get_linear_equality_constraint_names();
    std::vector<std::string> get_linear_variable_names();

    std::vector<std::string> get_nonlinear_constraint_names();
    std::vector<std::string> get_nonlinear_equality_constraint_names();
    std::vector<std::string> get_nonlinear_variable_names();

    std::string get_objective_name();
    std::string get_objective_function_string();

    std::string get_problem_type();

    double get_solution_objective_value() const;
    double get_solution_best_bound() const;
    std::string get_solution_path();
    std::string get_solution_status() const;
    std::unordered_map<std::string, double> get_solution_vector();

    void global_solve(unsigned long num_cores = 1, std::ostream &stream = std::cout);

    void import_model_file(const std::string &file_path);
    void import_solution_file(const std::string &file_path);

    void local_solve(const std::unordered_map<std::string, double> &initial_point = {});

    int num_binary_constraints();
    int num_binary_variables();
    int num_constraints();
    int num_continuous_variables();
    int num_linear_constraints();
    int num_nonlinear_constraints();
    int num_nonlinear_equality_constraints();
    int num_nonlinear_variables();
    int num_variables();

    void pprint(std::ostream &stream = std::cout) const;

    void read_options_file(const std::string &file_path);

    void remove_all_constraints();
    void remove_all_variables();
    void remove_constraint(const std::string &name);
    void remove_objective();
    void remove_variable(const std::string &var_name);

    void set_initial_point(const std::unordered_map<std::string, double> &point);
    void set_objective(const std::string &obj_str, ObjSense sense = ObjSense::Minimize);
    void set_option(const std::string &option, const std::string &value);
    void set_variable_bounds(const std::string &var_name, double lb, double ub);
    void set_variable_lb(const std::string &var_name, double value);
    void set_variable_type(const std::string &var_name, VarType type);
    void set_variable_ub(const std::string &var_name, double value);

    void write_current_solution_to_file(const std::string &file_name);
    void write_problem_to_mod_file(const std::string &file_name);
    void write_problem_to_NL_file(const std::string &file_name);
    void write_problem_to_ALE_file(const std::string &file_name);
    void write_problem_to_GAMS_file(const std::string &file_name);
    void write_problem_to_MPS_file(const std::string &file_name);
    void write_problem_to_LP_file(const std::string &file_name);
private:
    std::unique_ptr<api::Model> impl_{};
};
}  // namespace octeract

#endif  // OCTERACT_API_MODEL_H
