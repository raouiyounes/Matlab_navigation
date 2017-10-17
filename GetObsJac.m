
 function jH = GetObsJac(xPred, iFeature,Map)
 

jH = zeros(2,3);
save iFeature.mat iFeature;
tmp=Map(1:2,iFeature);
save tmp.mat tmp
save xPred.mat xPred;
Delta = (tmp-[xPred(1);xPred(2)]);
Delta=Delta./100;

r = norm(Delta);
jH(1,1) = -Delta(1) / r;
jH(1,2) = -Delta(2) / r;
jH(2,1) = Delta(2) / (r^2);
jH(2,2) = -Delta(1) / (r^2);
jH(2,3) = -1;
% f(x,u) Jacobian % x