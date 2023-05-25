set nodes := 1 2 3;

set pipes := 0 1 2 3;

param : arcs : L :=
1    2    80.0
1    3    50.0
2    3    120.0;

param E :=
1   20.0
2   0.0
3   0.0;

param P :=
1   0.0
2   8.0
3   12.0;

param D :=
1   -45.0
2   25.0
3   20.0;

param d :=
0   25.4
1   152.4
2   355.6
3   558.8;

param C :=
0   2.0
1   16.0
2   60.0
3   300.0;

param R :=
0   130.0
1   130.0
2   130.0
3   130.0;

param Source := 1;
