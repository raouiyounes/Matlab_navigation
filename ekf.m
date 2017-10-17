function  [PEst xEst]=ekf(xPred,k,QTrue,Map,PPred,u)

PYTrue = 20*diag([0.2,3*pi/180]).^2;
global RTrue;


UTrue = 5*diag([0.01,0.01,1*pi/180]).^2;
RTrue = diag([2.0,3*pi/180]).^2;

UEst = 4.0*UTrue;
REst = 4.0*RTrue;


REst = 1.0*RTrue;

QEst = eye(3,3)*QTrue;
PYEst =eye(2,2)*PYTrue;
global xrr;global yrr;global thetarr;
 global Map;
  [z, iFeature] = GetObservation(k);

  
  if(~isempty(z))
        %predict observation
 
 %h = line([xPred(1),Map(1,iFeature)],[xPred(2),Map(2,iFeature)]);

  %set(h,'linestyle',':');
 
        zPred = DoObservationModel(xPred,iFeature )
 % get observation Jacobian
 
% Map
% in=input('salam');
H  = GetObsJac(xPred,iFeature,Map)
        
        %do Kalman update:
        Innov = z-zPred        

        Innov(2) = AngleWrap(Innov(2));
          S = H*PPred*H'+REst;
          

        W = PPred*H'*inv(S);
jj=W*Innov;

 I = eye(3);




         xEst(1:2) = xPred(1:2)+ (jj(1:2))';
          xEst(3) = xPred(3);
        xEst(3) = AngleWrap(xEst(3));
       % PEst = PPred - W*H*PPred;
        PEst = (I-W*H)*PPred*(I-W*H)'+ W*REst*W';
        
        PEst = 0.5*(PEst+PEst'); % ensure symetry
    
  % PPred=A1(xEst,u)*QTrue*A1(xEst,u)'+B1(xEst,u)*PEst*B1(xEst,u)'
  %  PPred = A1(xEst,u)* PEst *A1(xEst,u)' + B1(xEst,u)* QTrue * B1(xEst,u)';
DoVehicleGraphics_beta([xEst(1), xEst(2) ,xEst(3)-pi/2]',PEst(1:2,1:2),4,[0 1])
    else
        %There was no observation available
        xEst = xPred;
        PEst = PPred;
        Innov = [NaN;NaN];
        S = NaN*eye(2);
     end;



function [xnow] = GetOdometry(k)
    global u;
persistent LastOdom; %internal to robot low-level controller
global QTrue;
global xTrue;
if(isempty(LastOdom))
    LastOdom = xTrue;
end;

xnow =tcomp(LastOdom,u ,LastOdom(3));
uNoise = sqrt(QTrue)*randn(3,1);
LastOdom = xnow;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% construct a series of odometry measurements
function u = GetRobotControl(k)
global nSteps;
u = [0; 0.025 ; 0.1*pi/180*sin(3*pi*k/nSteps)];
%u = [0; 0.15 ; 0.3*pi/180];
Map(1:2,iFeature)


function Jac = A(x,u)
  
s1 =sin(x(3));
c1 =cos(x(3));
Jac = [1 0 -u(1)*s1;
0 1 u(1)*c1;
0 0 1];
% f(x,u) Jacobian % u
function Jac = B(x,u)
  
s1 =sin(x(3));
c1 =cos(x(3));
Jac = [ -s1 0 0;
 c1 0 0;
0   0  1];
 