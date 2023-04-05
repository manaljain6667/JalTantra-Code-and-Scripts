using Pkg

println("Loading packages...")

try
    @eval using JuMP
catch
    println("Installing JuMP...")
    Pkg.add("JuMP")
    @eval using JuMP
end

try
    @eval using AmplNLWriter
catch
    println("Installing AmplNLWriter...")
    Pkg.add("AmplNLWriter")
    @eval using AmplNLWriter
end

println("Create model...")

m = Model(() -> AmplNLWriter.Optimizer("octeract-engine"))

@variable(m, 0 <= x1 <= 1)
@variable(m, 0 <= x2 <= 1)
@variable(m, 0 <= x3 <= 1)
@variable(m, 0 <= x4 <= 1)
@variable(m, 0 <= x5 <= 1)

@objective(m, Min, 42*x1 - 0.5*(100*x1*x1 + 100*x2*x2 + 100*x3*x3 + 100*x4*x4 + 100*x5*x5) + 44*x2 + 45*x3 + 47*x4 + 47.5*x5)
@constraint(m, con, 20*x1 + 12*x2 + 11*x3 + 7*x4 + 4*x5 <= 40)

println("Optimizing model...")

optimize!(m)

println("Objective value: ", objective_value(m))
