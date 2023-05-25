$title a Jaltantra model
Sets
    nodes   /1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32/
    pipes  /1, 2, 3, 4, 5, 6/
    src(nodes) /1/;
alias (src,srcs);
alias (nodes,j) ;
alias (nodes,j1);
Set arcs(nodes,j) / 1.2, 2.3, 3.4, 4.5, 5.6, 6.7, 7.8,  8.9, 9.10, 10.11, 11.12, 12.13, 10.14, 
                    14.15, 15.16,17.16, 18.17, 19.18, 3.19, 3.20, 20.21, 21.22,  20.23, 23.24, 24.25, 
                    26.25,  27.26,  16.27, 23.28, 28.29, 29.30, 30.31,  32.31, 25.32/;
*arcs(nodes,j) = not sameas(nodes,j);

Parameters
    Len(nodes,j) /  1   .2    100, 2   .3     1350, 3   .4   900, 4    .5    1150, 5    .6    1450,
                    6   .7    450, 7   .8     850,  8   .9   850, 9    .10   800, 10    .11    950,
                    11  .12  1200, 12  .13    3500, 10  .14  800, 14   .15   500, 15    .16    550,
                    17  .16  2730, 18  .17    1750, 19  .18  800, 3    .19   400, 3     .20    2200,
                    20  .21  1500, 21  .22    500,  20  .23  2650,23   .24   1230,24    .25    1300,
                    26  .25  850,  27  .26    300,  16  .27  750, 23   .28   1500,28    .29    2000,
                    29  .30  1600, 30  .31    150,  32  .31  860, 25   .32    950/
    E(nodes) /  1   100, 2   0, 3   0, 4   0, 5   0, 6   0, 7   0, 8   0, 9   0, 10   0, 11   0, 12   0, 13   0, 14   0, 15   0, 16   0,
                17   0, 18   0, 19   0, 20   0, 21   0, 22   0, 23   0, 24   0, 25   0, 26   0, 27   0, 28   0, 29   0, 30   0, 31   0, 32   0/
    P(nodes) /1   0, 2   30, 3   30, 4   30, 5   30, 6   30, 7   30, 8   30, 9   30, 10   30, 11   30, 12   30, 13   30, 14   30, 15   30,
              16   30, 17   30, 18   30, 19   30, 20   30, 21   30, 22   30, 23   30, 24   30, 25   30, 26   30, 27   30, 28   30, 29   30,
              30   30, 31   30, 32   30 /
    D(nodes) /1   -5538.8658000000005, 2   247.222, 3   236.111, 4   36.111, 5   201.388, 6   279.1666, 7   375, 8   152.778, 9   145.833,
              10   145.833, 11   138.88, 12   155.55, 13   261.11, 14   170.833, 15   77.777, 16   86.111, 17   240.277, 18   373.611,
              19   16.666, 20   354.1666, 21   258.333, 22   134.7222, 23   290.2777, 24   227.777, 25   47.222, 26   250, 27   102.777,
              28   80.555, 29   100, 30   100, 31   29.1666, 32   223.6111 /
    dis(pipes) /  1   304.8, 2   406.4, 3   508, 4   609.6, 5   762, 6   1016 /
    C(pipes) /  1   45.72617132, 2   70.4, 3   98.387, 4   129.33, 5   180.748, 6   278.28 /
    R(pipes) /  1   130, 2   130, 3   130, 4   130, 5   130, 6   130 /
    Source(src)   /1 1/;


Scalar omega  /10.68/;
Scalar bnd ;
Scalar qm;
Scalar q_M;

bnd = sum(src,D(src));
q_M=-bnd;
qm=0;

Variable l(nodes,j,pipes); 
l.lo(nodes,j,pipes)= EPS;

Variable q1(nodes,j);
q1.lo(nodes,j)=qm;
q1.up(nodes,j)=q_M;

Variable q2(nodes,j);
q2.lo(nodes,j)=qm;
q2.up(nodes,j)=q_M;

Variables z;

Variable h(nodes);

Equations cost "objective function",bound1(nodes,j,pipes),cons1(nodes),cons2(nodes),cons3(nodes,j),cons5(src), cons4(nodes,j), cons6(nodes,j) ;

cost..  z=e=sum(arcs(nodes,j),sum(pipes,l(arcs,pipes)*c(pipes)));

bound1(nodes,j,pipes)$arcs(nodes,j).. l(nodes,j,pipes) =l= Len(nodes,j);
cons1(nodes).. sum(arcs(j,nodes),(q1(arcs)-q2(arcs))) =e= sum(arcs(nodes,j),(q1(arcs)-q2(arcs))) + D(nodes);
cons2(nodes).. h(nodes) =g= E(nodes) + P(nodes);
cons3(arcs(nodes,j)).. h(nodes)-h(j)=e=sum(pipes,(((q1(arcs)*0.001)**1.852 - (q2(arcs)*0.001)**1.852)*omega*l(arcs,pipes))/((R(pipes)**1.852)*(dis(pipes)/1000)**4.87));
cons4(arcs(nodes,j)).. sum(pipes,l(arcs,pipes)) =e=Len(arcs);
cons5(src)..  h(src)=e= sum(srcs,E(srcs));
cons6(arcs(nodes,j)).. q1(arcs)*q2(arcs) =l= q_M*qm;

model m1  /all/  ;
m1.optfile = 1;
solve m1 using minlp minimizing z ;
