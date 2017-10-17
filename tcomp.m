 %-------------------------------------------------------
% composes two transformations
%
% Author:  Jose Neira
% Version: 1.0, 7-Dic-2000
%-------------------------------------------------------
% History:
%-------------------------------------------------------
function tac=tcomp(tab,tbc,theta),

if size(tab,1) ~= 3,
   error('TCOMP: tab is not a transformation!!!');
end;

if size(tbc,1) ~= 3,
   error('TCOMP: tbc is not a transformation!!!');
end;
result = tab(3)+tbc(3);

if result > 2*pi | result <= -2*pi
   result = AngleWrap(result) ;
end

s = sin(theta);
c = cos(theta);
tac = [tab(1:2)+ [c -s;s c]* tbc(1:2);
       result];
   