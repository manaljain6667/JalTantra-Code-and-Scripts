Sets
	nodes /1, 2, 3/
	pipes /0, 1, 2, 3, 4, 5/
	src(nodes) /1/;
alias (src,srcs);
alias (nodes,j) ;
Set arcs(nodes,j) /1.2, 1.3, 2.3/

Parameters
	Len(nodes,j) /1    .2    300.0, 1    .3    300.0, 2    .3    450.0/
	E(nodes) / 1 30.0,  2 0.0, 3 0.0/
	P(nodes) / 1 0.0,  2 20.0, 3 20.0/
	D(nodes) / 1 -180.0,  2 100.0, 3 80.0/
	dis(pipes) / 0 80.0,  1 100.0,  2 150.0,  3 200.0,  4 250.0, 5 300.0/
	C(pipes) / 0 960.0,  1 1020.0,  2 1110.0,  3 1200.0,  4 1290.0, 5 1380.0/
	R(pipes) / 0 130.0,  1 130.0,  2 130.0,  3 130.0,  4 130.0, 5 130.0/

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
