
function jac=A1(x,u)
s1=sin(x(3));
c1=cos(x(3));
jac=[1 0 -u(1)*s1-u(2)*c1;
    0 1 u(1)*c1-u(2)*s1;
    0 0 1];
