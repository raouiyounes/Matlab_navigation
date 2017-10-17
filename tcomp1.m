function d=tcomp1(dx,dy,theta)
c=cos(theta);
s=sin(theta);
d=(inv([c -s;s c]))*[dx;dy];