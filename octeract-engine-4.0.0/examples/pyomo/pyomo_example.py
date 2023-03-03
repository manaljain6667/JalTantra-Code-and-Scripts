from pyomo.environ import *

model = m = ConcreteModel()

m.x1 = Var(within=Reals,bounds=(0,1),initialize=1)
m.x2 = Var(within=Reals,bounds=(0,1),initialize=1)
m.x3 = Var(within=Reals,bounds=(0,1),initialize=None)
m.x4 = Var(within=Reals,bounds=(0,1),initialize=1)
m.x5 = Var(within=Reals,bounds=(0,1),initialize=None)

x1 = m.x1
x2 = m.x2
x3 = m.x3
x4 = m.x4
x5 = m.x5


m.obj = Objective(expr = 42*x1 - 0.5*(100*x1*x1 + 100*x2*x2 + 100*x3*x3 + 100*x4*x4 + 100*
                    x5*x5) + 44*x2 + 45*x3 + 47*x4 + 47.5*x5, sense=minimize)

m.e2 = Constraint(expr = 20*x1 + 12*x2 + 11*x3 + 7*x4 + 4*x5 <= 40)

SolverFactory("octeract-engine").solve(m,tee=True,keepfiles=False)