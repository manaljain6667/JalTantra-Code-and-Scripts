$title a Jaltantra model
Sets
    nodes   /1, 2, 3, 4, 5, 6, 7 /
    pipes  /1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14/
    src(nodes) /1/;
alias (src,srcs);
alias (nodes,j) ;
alias (nodes,j1);
Set arcs(nodes,j) /1.2, 2.4, 2.3, 3.5, 4.5, 4.6, 7.5,6.7/


Parameters
    Len(nodes,j) /  1  .2  1000 , 2  .4  1000 , 2  .3  1000 , 3  .5  1000
                    4  .5  1000 , 4  .6  1000 , 7  .5  1000 , 6  .7  1000/
    E(nodes) / 1   210 , 2   150 , 3   160 , 4   155 , 5   150 , 6   165 , 7   160 /
    P(nodes) /1   0 , 2   30 , 3   30 , 4   30 , 5   30 , 6   30 , 7   30 /
    D(nodes) /1   -311.1087 , 2   27.7777 , 3   27.777 , 4   33.333 , 5   75 , 6   91.666 , 7   55.555/
    dis(pipes) /  1 25.4, 2 50.8 , 3 76.2 , 4 101.6 , 5 152.4 , 6 203.2 , 7 254 , 8 304.8 , 9 355.6 , 
                    10   406.4 , 11   457.2 , 12   508 , 13   558.8 , 14   609.6/
    C(pipes) /  1   2 , 2   5 , 3   8 , 4   11 , 5   16 , 6   23 , 7   32
                8   50 , 9   60 , 10   90 , 11   130 , 12   170 , 13   300 , 14   550 /
    R(pipes) /  1   130 , 2   130 , 3   130 , 4   130 , 5   130 , 6   130 , 7   130
                8   130 , 9   130 , 10   130 , 11   130 , 12   130 , 13   130 , 14   130 /
    Source(src)   /1 1/;


Scalar omega  /10.68/;
Scalar bnd ;
Scalar qm;
Scalar q_M;

bnd = sum(src,D(src));
q_M=-bnd;
qm=bnd;

Variable l(nodes,j,pipes);
l.lo(nodes,j,pipes)= 0;

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
solve m1 using minlp minimizing z ;
