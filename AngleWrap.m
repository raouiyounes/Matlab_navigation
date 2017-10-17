function a = AngleWrap(a)

if(a>2*pi)
    a=a-2*pi;
elseif(a<-2*pi)
    a = a+2*pi;
end;
