Sets
    nodes   /Node1, Node2, Node3, Node4, Node5, Node6, Node7/
    cycle   /cycle1, cycle2/
    links   /Pipe_1_2, Pipe_2_4, Pipe_2_3, Pipe_3_5, Pipe_4_5, Pipe_4_6, Pipe_7_5, Pipe_6_7/
    pipes   /1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14/
    src(nodes) /Node1/;

Parameters
    link_length(links) /Pipe_1_2   1000, Pipe_2_4   1000, Pipe_2_3   1000, Pipe_3_5   1000, Pipe_4_5   1000, Pipe_4_6   1000, Pipe_7_5   1000, Pipe_6_7   1000/
    elevation(nodes) /Node1   210, Node2   150, Node3   160, Node4   155, Node5   150, Node6   165, Node7   160/
    pressure(nodes) /Node1   0, Node2   30, Node3   30, Node4   30, Node5   30, Node6   30, Node7   30/
    demand(nodes) /Node1   -311.1087, Node2   27.7777, Node3   27.777, Node4   33.333, Node5   75, Node6   91.666, Node7   55.555/
    diameter(pipes) /1   25.4, 2   50.8, 3   76.2, 4   101.6, 5   152.4, 6   203.2, 7   254, 8   304.8, 9   355.6, 10   406.4, 11   457.2, 12   508, 13   558.8, 14   609.6/
    Cost(pipes) /1   2, 2   5, 3   8, 4   11, 5   16, 6   23, 7   32, 8   50, 9   60, 10   90, 11   130, 12   170,13   300, 14   550/
    Roughness(pipes) /1   130, 2   130, 3   130, 4   130, 5   130, 6   130, 7   130, 8   130, 9   130, 10   130, 11   130, 12   130, 13   130, 14   130/
    sourcehead(src) /Node1 210/;


Table F(nodes,links) "Flow Direction Matrix"
                Pipe_1_2 Pipe_2_4 Pipe_2_3 Pipe_3_5 Pipe_4_5 Pipe_4_6 Pipe_7_5 Pipe_6_7
        Node1  -1           0        0           0       0       0       0       0
        Node2   1          -1        -1          0       0       0       0       0
        Node3   0           0        1           -1      0       0       0       0
        Node4   0           1        0           0       -1      -1      0       0
        Node5   0           0        0           1       1       0       1       0
        Node6   0           0        0           0       0       1       0       -1
        Node7   0           0        0           0       0       0       -1      1;

Table S(nodes,links) "Matrix for flow Direction in Spanning Tree"
                Pipe_1_2 Pipe_2_4 Pipe_2_3 Pipe_3_5 Pipe_4_5 Pipe_4_6 Pipe_7_5 Pipe_6_7
        Node1   0           0       0           0       0       0       0       0
        Node2   1           0       0           0       0       0       0       0
        Node3   1           0       1           0       0       0       0       0
        Node4   1           1       0           0       0       0       0       0
        Node5   1           0       1           1       0       0       0       0
        Node6   1           1       0           0       0       1       0       0
        Node7   1           0       1           1       0       0       -1      0;

Table C(cycle,links) "Cycle Flow Direction Matrix"
                Pipe_1_2 Pipe_2_4 Pipe_2_3 Pipe_3_5 Pipe_4_5 Pipe_4_6 Pipe_7_5 Pipe_6_7
        cycle1   0          1       -1          -1      1       0       0       0
        cycle2   0          1       -1          -1      0       1       1       1;

Scalar omega  /10.68/;
Scalar bnd ;
Scalar qm;
Scalar q_M;

bnd = sum(src,demand(src));
q_M=-bnd;
qm=10**(-30);

Variable l(links,pipes);
l.lo(links,pipes) = 0;

Variable q1(links);
q1.lo(links) = qm;
q1.up(links) = q_M;

Variable q2(links);
q2.lo(links) = qm;
q2.up(links) = q_M;

Binary Variable x1; 
Variables z;


Equations obj "objective function",bound1(links,pipes),cons1(nodes),cons2(cycle),cons3a(nodes),cons3b(nodes), cons4(links), cons5(links);
obj.. z=e=sum(links,sum(pipes,l(links,pipes)*Cost(pipes)));

bound1(links,pipes).. l(links,pipes) =l= link_length(links);

cons1(nodes).. sum(links,F(nodes,links)*(q1(links)-q2(links))) =e= demand(nodes);

cons2(cycle).. sum(links,sum(pipes,C(cycle,links)*omega*l(links,pipes)*((q1(links)/1000)**1.852-(q2(links)/1000)**1.852)/((Roughness(pipes)**1.852)*((diameter(pipes)/1000)**4.87)))) =e= 0;

cons3a(nodes).. sum(links,sum(pipes,S(nodes,links)*omega*l(links,pipes)*((q1(links)/1000)**1.852-(q2(links)/1000)**1.852)/((Roughness(pipes)**1.852)*((diameter(pipes)/1000)**4.87)))) =l= sum(src,sourcehead(src))-elevation(nodes)-pressure(nodes);
cons3b(nodes).. sum(links,sum(pipes,S(nodes,links)*omega*l(links,pipes)*((q1(links)/1000)**1.852-(q2(links)/1000)**1.852)/((Roughness(pipes)**1.852)*((diameter(pipes)/1000)**4.87)))) =g= 0;

cons4(links).. q1(links)*q2(links) =l= q_M*qm;
cons5(links).. sum(pipes,l(links,pipes)) =e= link_length(links);


model m3d1  /all/  ;
solve m3d1 using dnlp minimizing z ;