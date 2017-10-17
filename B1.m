
function jac=B1(x,u)
s1=sin(x(3));
c1=cos(x(3));
jac=[c1 -s1 0;s1 c1 0;0 0 1];
