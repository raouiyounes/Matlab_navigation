% function [z] = DoObservationModel(xVeh, iFeature,k)
% global Map;
% global iFeature;
% a=camera(Map(1,iFeature),Map(2,iFeature),0,k);
% delta=zeros(1,2);
%  Delta(1) = a(1)-xVeh(1);
%   Delta(2) = a(2)-xVeh(2);
%  
% z = [norm(Delta);
%     atan2(Delta(2),Delta(1))-xVeh(3)];
% z(2) = AngleWrap(z(2));
% % 
% function [z] = DoObservationModel(xVeh, xFeature,k)
% xFeature=round(xFeature);
% a=camera(xFeature(1),xFeature(2),0,k);
% 
% 
% a=a';
%  
% 
% Delta = a(1:2)-xVeh(1:2);
% z = [norm(Delta);
% %     atan2(Delta(2),Delta(1))-xVeh(3)];
% % z(2) = AngleWrap(z(2));
function [z] = DoObservationModel(xVeh, iFeature,Map)
global Map;
save Map.mat Map

tmp=Map(1:2,iFeature);


Delta = (tmp-[xVeh(1);xVeh(2)]);
Delta=Delta./10;


z = [norm(Delta);
    atan2(Delta(2),Delta(1))-xVeh(3)];
z(2) = AngleWrap(z(2));
