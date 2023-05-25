Sets
	nodes /1, 2, 3/
	pipes /0, 1, 2, 3/
	src(nodes) /1/;
alias (src,srcs);
alias (nodes,j) ;
Set arcs(nodes,j) /1.2, 1.3, 2.3/

Parameters
	Len(nodes,j) /1    .2    80.0, 1    .3    50.0, 2    .3    120.0/
	E(nodes) / 1 20.0,  2 0.0, 3 0.0/
	P(nodes) / 1 0.0,  2 8.0, 3 12.0/
	D(nodes) / 1 -45.0,  2 25.0, 3 20.0/
	dis(pipes) / 0 25.4,  1 152.4,  2 355.6, 3 558.8/
	C(pipes) / 0 2.0,  1 16.0,  2 60.0, 3 300.0/
	R(pipes) / 0 130.0,  1 130.0,  2 130.0, 3 130.0/

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
