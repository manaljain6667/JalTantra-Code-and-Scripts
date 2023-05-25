Sets
	nodes /1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73/
	pipes /0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11/
	src(nodes) /1/;
alias (src,srcs);
alias (nodes,j) ;
Set arcs(nodes,j) /2.29, 3.2, 4.40, 5.51, 6.40, 7.56, 8.11, 9.21, 1.10, 11.4, 12.7, 13.43, 14.4, 15.55, 16.1, 17.24, 18.30, 19.5, 20.42, 21.45, 22.25, 23.19, 24.20, 25.38, 26.32, 27.36, 28.65, 29.41, 30.14, 31.1, 32.33, 33.20, 34.47, 35.2, 36.23, 37.50, 38.48, 39.46, 40.37, 41.50, 42.9, 43.47, 44.12, 45.31, 46.23, 47.2, 48.13, 49.19, 50.39, 51.66, 52.15, 53.50, 54.52, 55.38, 56.3, 57.70, 58.60, 59.10, 60.71, 61.65, 62.25, 63.28, 64.59, 65.44, 66.21, 67.73, 68.16, 69.61, 70.35, 71.54, 10.72, 73.71, 53.39, 17.7, 54.60, 58.15, 38.15, 36.49, 54.18, 48.8, 59.18, 9.17, 53.51, 72.68, 26.72, 46.19, 24.42, 41.37, 57.13, 64.72, 36.41, 4.45, 11.30, 42.45, 63.69, 68.32, 51.46, 22.13, 67.60, 18.31, 58.25/

Parameters
	Len(nodes,j) /2    .29    87.86, 3    .2    69.07, 4    .40    34.49, 5    .51    7.522, 6    .40    33.91, 7    .56    36.15, 8    .11    63.47, 9    .21    88.88, 1    .10    113.7, 11    .4    63.48, 12    .7    43.68, 13    .43    19.29, 14    .4    9.738, 15    .55    35.12, 16    .1    94.39, 17    .24    80.91, 18    .30    79.22, 19    .5    23.63, 20    .42    87.01, 21    .45    59.21, 22    .25    34.9, 23    .19    19.84, 24    .20    85.55, 25    .38    114.5, 26    .32    111.0, 27    .36    30.09, 28    .65    73.52, 29    .41    50.69, 30    .14    80.06, 31    .1    58.91, 32    .33    85.53, 33    .20    117.8, 34    .47    53.35, 35    .2    68.04, 36    .23    16.59, 37    .50    18.15, 38    .48    58.67, 39    .46    9.905, 40    .37    69.25, 41    .50    57.11, 42    .9    31.35, 43    .47    52.05, 44    .12    116.0, 45    .31    80.38, 46    .23    23.86, 47    .2    79.36, 48    .13    34.04, 49    .19    13.53, 50    .39    10.99, 51    .66    37.35, 52    .15    129.8, 53    .50    17.36, 54    .52    51.88, 55    .38    66.29, 56    .3    48.99, 57    .70    106.6, 58    .60    64.51, 59    .10    132.7, 60    .71    41.44, 61    .65    104.8, 62    .25    79.31, 63    .28    94.52, 64    .59    355.4, 65    .44    46.4, 66    .21    31.82, 67    .73    328.8, 68    .16    44.05, 69    .61    57.6, 70    .35    160.8, 71    .54    90.43, 10    .72    118.7, 73    .71    47.96, 53    .39    19.95, 17    .7    126.1, 54    .60    95.4, 58    .15    203.0, 38    .15    92.93, 36    .49    47.11, 54    .18    140.2, 48    .8    102.9, 59    .18    241.9, 9    .17    90.33, 53    .51    47.0, 72    .68    149.2, 26    .72    199.3, 46    .19    39.72, 24    .42    122.2, 41    .37    60.7, 57    .13    259.9, 64    .72    570.9, 36    .41    58.77, 4    .45    112.4, 11    .30    114.8, 42    .45    140.3, 63    .69    259.9, 68    .32    215.2, 51    .46    33.21, 22    .13    198.6, 67    .60    347.7, 18    .31    154.3, 58    .25    246.8/
	E(nodes) / 1 45.0,  2 14.0,  3 17.0,  4 15.0,  5 12.0,  6 12.0,  7 14.0,  8 16.0,  9 12.0,  10 16.0,  11 14.0,  12 16.0,  13 13.0,  14 9.0,  15 17.0,  16 13.0,  17 8.0,  18 18.0,  19 14.0,  20 9.0,  21 19.0,  22 9.0,  23 11.0,  24 17.0,  25 17.0,  26 15.0,  27 19.0,  28 8.0,  29 17.0,  30 11.0,  31 9.0,  32 17.0,  33 12.0,  34 14.0,  35 17.0,  36 12.0,  37 16.0,  38 15.0,  39 12.0,  40 14.0,  41 16.0,  42 11.0,  43 16.0,  44 22.0,  45 12.0,  46 13.0,  47 8.0,  48 11.0,  49 11.0,  50 12.0,  51 13.0,  52 5.0,  53 18.0,  54 17.0,  55 14.0,  56 13.0,  57 15.0,  58 15.0,  59 10.0,  60 13.0,  61 13.0,  62 11.0,  63 18.0,  64 12.0,  65 21.0,  66 10.0,  67 17.0,  68 14.0,  69 17.0,  70 20.0,  71 12.0,  72 10.0, 73 8.0/
	P(nodes) / 1 0.0,  2 0.0,  3 0.0,  4 0.0,  5 0.0,  6 0.0,  7 0.0,  8 0.0,  9 0.0,  10 0.0,  11 0.0,  12 0.0,  13 0.0,  14 0.0,  15 0.0,  16 0.0,  17 0.0,  18 0.0,  19 0.0,  20 0.0,  21 0.0,  22 0.0,  23 0.0,  24 0.0,  25 0.0,  26 0.0,  27 0.0,  28 0.0,  29 0.0,  30 0.0,  31 0.0,  32 0.0,  33 0.0,  34 0.0,  35 0.0,  36 0.0,  37 0.0,  38 0.0,  39 0.0,  40 0.0,  41 0.0,  42 0.0,  43 0.0,  44 0.0,  45 0.0,  46 0.0,  47 0.0,  48 0.0,  49 0.0,  50 0.0,  51 0.0,  52 0.0,  53 0.0,  54 0.0,  55 0.0,  56 0.0,  57 0.0,  58 0.0,  59 0.0,  60 0.0,  61 0.0,  62 0.0,  63 0.0,  64 0.0,  65 0.0,  66 0.0,  67 0.0,  68 0.0,  69 0.0,  70 0.0,  71 0.0,  72 0.0, 73 0.0/
	D(nodes) / 1 -496.09774,  2 0.0654,  3 0.0254,  4 0.0473,  5 0.0067,  6 0.00729,  7 0.0443,  8 0.0358,  9 0.0453,  10 0.0785,  11 0.052,  12 0.0343,  13 0.11,  14 0.0193,  15 0.0991,  16 0.0298,  17 0.0639,  18 0.132,  19 0.0208,  20 0.0624,  21 0.0387,  22 0.0502,  23 0.013,  24 0.0621,  25 0.102,  26 0.0667,  27 0.00647,  28 0.0361,  29 0.0298,  30 0.0589,  31 0.0631,  32 0.0885,  33 0.0437,  34 0.0115,  35 0.0492,  36 0.0328,  37 0.0318,  38 0.0715,  39 0.00878,  40 0.0296,  41 0.0489,  42 0.0819,  43 0.0153,  44 0.0349,  45 0.0843,  46 0.0229,  47 0.0397,  48 0.0421,  49 0.013,  50 0.0223,  51 0.0269,  52 0.0391,  53 0.0181,  54 0.0812,  55 0.0218,  56 0.0183,  57 0.0,  58 0.17,  59 0.17,  60 0.17,  61 0.17,  62 0.159,  63 0.709,  64 1.85,  65 0.449,  66 0.083,  67 0.812,  68 0.49,  69 0.381,  70 122.0,  71 122.0,  72 122.0, 73 122.0/
	dis(pipes) / 0 63.0,  1 75.0,  2 90.0,  3 110.0,  4 125.0,  5 140.0,  6 160.0,  7 180.0,  8 200.0,  9 250.0,  10 280.0, 11 315.0/
	C(pipes) / 0 116.0,  1 172.0,  2 231.0,  3 340.0,  4 461.0,  5 576.0,  6 750.0,  7 945.0,  8 1113.0,  9 1762.0,  10 2210.0, 11 2794.0/
	R(pipes) / 0 140.0,  1 140.0,  2 140.0,  3 140.0,  4 140.0,  5 140.0,  6 140.0,  7 140.0,  8 140.0,  9 140.0,  10 140.0, 11 140.0/

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
