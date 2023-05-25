$title a Jaltantra model
Sets
    nodes   /20, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19 /
    pipes  /1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13/
    src(nodes) /20/;
alias (src,srcs);
alias (nodes,j) ;
alias (nodes,j1);
Set arcs(nodes,j) /2.1, 7.6, 8.7, 9.8, 10.9, 6.11, 7.12, 8.13, 9.14, 20.10, 12.11, 3.2, 13.12, 14.13, 11.15, 11.16, 12.17, 13.18, 14.19, 15.16, 17.16, 18.17, 
4.3, 19.18, 19.20, 4.5  , 1.6  , 7.2  , 8.3, 9.4  , 10.5/

Parameters
    Len(nodes,j) /2    .1    150, 7    .6    150, 8    .7    150, 9    .8    150, 10    .9    350, 6    .11    160, 7    .12    160, 8    .13    160, 
9    .14    160, 20    .10    400, 12    .11    150, 3    .2    150, 13    .12    150, 14    .13    150, 11    .15    150,
11    .16    200, 12    .17    200, 13    .18    200, 14    .19    200, 15    .16    200, 17    .16    150, 18    .17    150,
4    .3    150, 19    .18    150, 19    .20    550, 4    .5    350, 1    .6    200, 7    .2    200, 8    .3    200, 9    .4    200, 10    .5    200  /
    E(nodes) /20   113, 1   75, 2   75, 3   75.5, 4   76, 5   76, 6   71, 7   72, 8   74, 9   75, 10   76, 11   68, 12   69, 13   71, 14   73, 
15   63, 16   64, 17   67, 18   69, 19   71  /
    P(nodes) /20   0, 1   15, 2   15, 3   15, 4   15, 5   15, 6   15, 7   15, 8   15, 9   15, 10   15, 11   15, 12   15, 13   15, 14   15, 
15   15, 16   15, 17   15, 18   15, 19   15 /
    D(nodes) /20   -462.9623999999999, 1   23.1481, 2   23.1481, 3   23.1481, 4   23.1481, 5   23.1481, 6   11.5741, 7   23.1481, 8   23.1481,
9   34.7222, 10   34.7222, 11   11.5741, 12   23.1481, 13   34.7222, 14   34.7222, 15   23.1481, 16   11.5741, 17   23.1481, 18   23.1481, 19   34.7222 /
    dis(pipes) / 1   100, 2   150, 3   200, 4   250, 5   300, 6   350, 7   400, 8   450, 9   500, 10   600, 11   700, 12   800, 13   900  /
    C(pipes) /1   860, 2   1160, 3   1470, 4   1700, 5   2080, 6   2640, 7   3240, 8   3810, 9   4400, 10   5580, 11   8360, 12   10400, 13   12800 /
    R(pipes) /1   100, 2   100, 3   100, 4   100, 5   100, 6   100, 7   100, 8   100, 9   100, 10   100, 11   100, 12   100, 13   100  /;
   


Scalar omega  /10.68/;
Scalar bnd ;
Scalar qm;
Scalar q_M;

bnd = sum(src,D(src));
q_M=-bnd;
qm=bnd;

Variable l(nodes,j,pipes); 
l.lo(nodes,j,pipes)= EPS;

Variable q(nodes,j);
q.lo(nodes,j)=qm;
q.up(nodes,j)=q_M;

Variables z;

Variable h(nodes);

Equations cost "objective function",bound1(nodes,j,pipes),cons1(nodes),cons2(nodes),cons3(nodes,j),cons5(src), cons4(nodes,j) ;

cost..  z=e=sum(arcs(nodes,j),sum(pipes,l(arcs,pipes)*c(pipes)));

bound1(nodes,j,pipes)$arcs(nodes,j).. l(nodes,j,pipes) =l= Len(nodes,j);
cons1(nodes).. sum(arcs(j,nodes),q(arcs)) =e= sum(arcs(nodes,j),q(arcs)) + D(nodes);
cons2(nodes).. h(nodes) =g= E(nodes) + P(nodes);
cons3(arcs(nodes,j)).. h(nodes)-h(j)=e=sum(pipes,((q(arcs)*(abs(q(arcs))**0.852))*(0.001**1.852)*omega*l(arcs,pipes)/((R(pipes)**1.852)*(dis(pipes)/1000)**4.87)));
cons4(arcs(nodes,j)).. sum(pipes,l(arcs,pipes)) =e=Len(arcs);
cons5(src)..  h(src)=e= sum(srcs,E(srcs));

model m1  /all/  ;
m1.optfile = 1;
solve m1 using minlp minimizing z ;





