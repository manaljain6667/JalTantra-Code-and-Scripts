from octeract import *

def main():

    m = Model()

    m.add_variable("x1", 0, 1)
    m.add_variable("x2", 0, 1)
    m.add_variable("x3", 0, 1)
    m.add_variable("x4", 0, 1)
    m.add_variable("x5", 0, 1)

    m.set_objective("42*x1 - 0.5*(100*x1*x1 + 100*x2*x2 + 100*x3*x3 + 100*x4*x4 + 100*x5*x5) + 44*x2 + 45*x3 + 47*x4 + 47.5*x5")
    m.add_constraint("20*x1 + 12*x2 + 11*x3 + 7*x4 + 4*x5 <= 40")

    print(m)

    m.global_solve(4);

    m.print_solution_summary();

if __name__ == '__main__':
    main()
