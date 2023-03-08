Sets
	nodes /1, 2, 3, 4, 6, 7, 8, 9, 10, 11/
	pipes /0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12/
	src(nodes) /8/;
alias (src,srcs);
alias (nodes,j) ;
Set arcs(nodes,j) /3.7, 2.6, 2.4, 9.3, 8.9, 10.2, 3.10, 11.1, 4.11/

Parameters
	Len(nodes,j) /3    .7    7345.0, 2    .6    3491.0, 2    .4    2442.0, 9    .3    1943.0, 8    .9    2686.0, 10    .2    4808.0, 3    .10    924.0, 11    .1    4266.0, 4    .11    485.0/
	E(nodes) / 1 442.0,  2 477.0,  3 496.0,  4 464.0,  6 390.0,  7 493.0,  8 530.0,  9 517.0,  10 509.0, 11 472.0/
	P(nodes) / 1 7.0,  2 7.0,  3 7.0,  4 7.0,  6 7.0,  7 7.0,  8 0.0,  9 7.0,  10 7.0, 11 7.0/
	D(nodes) / 1 4.2,  2 1.6,  3 6.8,  4 3.5,  6 3.6,  7 5.2,  8 -24.900000000000002,  9 0.0,  10 0.0, 11 0.0/
	dis(pipes) / 0 63.0,  1 75.0,  2 90.0,  3 110.0,  4 125.0,  5 140.0,  6 160.0,  7 180.0,  8 200.0,  9 225.0,  10 250.0,  11 280.0, 12 315.0/
	C(pipes) / 0 116.0,  1 172.0,  2 231.0,  3 340.0,  4 461.0,  5 576.0,  6 750.0,  7 945.0,  8 1113.0,  9 1430.0,  10 1762.0,  11 2210.0, 12 2794.0/
	R(pipes) / 0 140.0,  1 140.0,  2 140.0,  3 140.0,  4 140.0,  5 140.0,  6 140.0,  7 140.0,  8 140.0,  9 140.0,  10 140.0,  11 140.0, 12 140.0/

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
