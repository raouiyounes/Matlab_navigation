function [z,iFeature] = GetObservation(k,Map)
%% re�oit l'etape de la simulation et retourne l'observation et le rang du
%% feature observ�
 global xrr; global yrr; global thetarr;
global Map;global xTrue;global RTrue;global nSteps;
nSteps = 10;

%fake sensor failure here
if(abs(k-nSteps/2)<0.1*nSteps)
    z = [];
    iFeature = -1;
else    
    iFeature = ceil(size(Map,2)*rand(1));
    z = DoObservationModel([xrr(k);yrr(k);thetarr(k)], iFeature,Map)+sqrt(RTrue)*randn(2,1);
    z(2) = AngleWrap(z(2));
end;





% 
% 
% global Map;global xVehicleTrue;global RTrue;global nSteps;global SensorSettings
% global xrr; global yrr; global thetarr;
% done = 0;
% Trys = 1;
% % z =[];iFeature = -1;
% % while(~done & Trys <0.5*size(Map,2))
%   RTrue = diag([4,3*pi/180]).^2;
% 
% %    choose a random feature to see from True MGetObservationap
%     iFeature = ceil(size(Map,2)*rand(1));
%    
% z = DoObservationModel([xrr(k);yrr(k);thetarr(k)],iFeature  )+sqrt(RTrue)*randn(2,1);
% 
% 
% z(2) = AngleWrap(z(2));
%     %look forward...and only up to 40m
% %     if(abs(pi/2-z(2))<SensorSettings.FieldOfView*pi/180 & z(1) < SensorSettings.Range)
% %         done =1 ;
% %     else
% %         Trys =Trys+1;
% %         z =[];iFeature = -1;
% %     end;
% % end;
% % 
% % function [z,iFeature] = GetObservation(k)
% % global Map;global xTrue;global PYTrue;global nSteps;
% % global xrr;global yrr;global thetarr;
% % global Map;global xVehicleTrue;global RTrue;global nSteps;global SensorSettings
% % global xrr; global yrr; global thetarr;
% % 
% % iFeature = ceil(size(Map,2)*rand(1))
% % 
% % 
% %     z = DoObservationModel([xrr(k);yrr(k);thetarr(k)],Map(:,iFeature))+sqrt(RTrue)*randn(2,1);
% % z(2) = AngleWrap(z(2));
% 
% 
% 
% 
% 
% 
% 
% % % function [z,iFeature] = GetObservation(k)
% % % global Map;global xTrue;global PYTrue;global nSteps;
% % % global xrr;global yrr;global thetarr;
% % % iFeature = ceil(size(Map,2)*rand(1))
% % % 
% % % 
% % % z = DoObservationModel([xrr(k);yrr(k);thetarr(k)], iFeature,Map)+sqrt(PYTrue)*randn(2,1);
% % % z(2) = AngleWrap(z(2));
% % 
% % 
% % function z = GetObservation(k)
% % global Map;global xVehicleTrue;global RTrue;global nSteps;global SensorSettings
% % global xrr; global yrr; global thetarr;
% % global xTrue;global PYTrue;
% % done = 0;
% % Trys = 1;
% %  
% % %while(~done & Trys <0.5*size(Map,2))
% %    iFeature = ceil(size(Map,2)*rand(1));
% % %    choose a random feature to see from True Map
% % 
% %     z = DoObservationModel([xrr(k) yrr(k) thetarr(k)], iFeature,Map)+sqrt(PYTrue)*[1;1];
% %     z(2) = AngleWrap(z(2));
% %     %look forward...and only up to 40m
% %   %  if(abs(pi/2-z(2))<SensorSettings.FieldOfView*pi/180 & z(1) < SensorSettings.Range)
% %    %     done =1 ;
% %    % else
% %   %      Trys =Trys+1;
% %          
% % %    end;
% % %end;
% % % 