#include "octeract.h"

using namespace octeract;

int main()
{
    // Instantiate model
    auto m = Model();

    // Set the variable bounds
    m.add_variable("x1", 0);
    m.add_variable("x2", 0);
    m.add_variable("x3", 0);
    m.add_variable("x4", 0);
    m.add_variable("x5", 0);
    m.add_variable("x6", 0, 100);
    m.add_variable("x7", 0, 200);
    m.add_variable("x8", 0);
    m.add_variable("x9", 0);
    m.add_variable("x10", 0);
    m.add_variable("x11", 0);
    m.add_variable("x12", 0);
    m.add_variable("b1", 0, 1, octeract::VarType::Binary);
    m.add_variable("b2", 0, 1, octeract::VarType::Binary);
    m.add_variable("i1", 0, 3, octeract::VarType::Integer);

    // Set the objective
    m.set_objective("x1-x2-i1");

    // Add the constraints
    m.add_constraint("x1 - 6*x3 - 16*x4 - 10*x5 = 0");
    m.add_constraint("x2 - 9*x6 - 15*x7 = 0");
    m.add_constraint("x6 - x8 - x10 = 0");
    m.add_constraint("x7 - x9 - x11 = 0");
    m.add_constraint("x3 + x4 - x10 - x11 = 0");
    m.add_constraint("x5 - x8 - x9 = 0");
    m.add_constraint("x12*(x10 + x11) - 3*x3 - x4 + b2 = 0");
    m.add_constraint("x12*x10 - 2.5*x10*i1 - 0.5*x8*b1 <= 0");
    m.add_constraint("x12*x11 - 1.5*x11 + 0.5*x9 <= 0");
    m.add_constraint("b1 + b2 <= 1");

    m.global_solve(4);

    return 0;
}