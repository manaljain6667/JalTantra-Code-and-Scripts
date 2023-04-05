*  Total # variables       : 5
*  -- continuous           : 5
*  -- binary               : 0
*  -- integer              : 0
*  
*  Total # of constraints  : 1
*  

$offdigit

VARIABLES x1,x2,x3,x4,x5;

VARIABLES objvar;

EQUATIONS con1,objeqn;

con1    ..  4*x5+11*x3+7*x4+12*x2+20*x1+0=L=40;

objeqn  ..  (-50*(x5)**(2))+(-50*(x3)**(2))+(-50*(x2)**(2))+(-50*(x1)**(2))+(-50*(x4)**(2))+47.5*x5+45*x3+47*x4+44*x2+42*x1+0 - objvar =E= 0;


* set non default upper bounds 

x1.up     = 1;
x2.up     = 1;
x3.up     = 1;
x4.up     = 1;
x5.up     = 1;


* set non default lower bounds 

x1.lo     = 0;
x2.lo     = 0;
x3.lo     = 0;
x4.lo     = 0;
x5.lo     = 0;


Model m / all /;

m.limrow=0; m.limcol=0;

$if NOT '%gams.u1%' == '' $include '%gams.u1%' 

option nlp=octeract;

Solve m using NLP minimizing objvar;
