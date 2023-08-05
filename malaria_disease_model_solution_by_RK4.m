clear all
close all
clc
beta1=1/730;
alpham=0.13;
alphah=0.027;
gemma1=0.020;   
si=0.038;
beta2=0.001;
exi=0.13;
gemma3=0.072;
gemma2=0.010;
eatah=0.0004;
delta2=0.001;
delta1=0.001;
p=0.611;
epsilon=0.05;
eatam=0.02;
v=0.01;
e=0.022;
sigma=0.03;
sh(1)=.03;
eh(1)=.06;
ih(1)=.01;
rh(1)=.04;
sm(1)=.02;
im(1)=.05;
Sh_xy=@(x,sh,eh,ih,rh,sm,im) alphah+beta1*rh-gemma1*si*ih*sh-gemma2*exi*im*sh-(delta1+eatah)*sh;
Eh_xy=@(x,sh,eh,ih,rh,sm,im) gemma2*exi*im*sh+gemma1*si*ih*sh-(beta2+delta2+eatah)*eh;
Ih_xy=@(x,sh,eh,ih,rh,sm,im) beta2*eh-(epsilon+p*v+eatah)*ih;
Rh_xy=@(x,sh,eh,ih,rh,sm,im) delta1*sh+p*v*ih+delta2*eh-(beta1+eatah)*rh;
Sm_xy=@(x,sh,eh,ih,rh,sm,im) alpham-(sigma+eatam)*sm-gemma3*e*sm*ih;
Im_xy=@(x,sh,eh,ih,rh,sm,im) gemma3*e*ih*sm-(sigma+eatam)*im;

h=.5;
t=1:h:200;
for i=1:(length(t)-1)
    a1 = h*Sh_xy(t(i),sh(i),eh(i),ih(i),rh(i),sm(i),im(i));
    b1 = h*Eh_xy(t(i),sh(i),eh(i),ih(i),rh(i),sm(i),im(i));
    c1 = h*Ih_xy(t(i),sh(i),eh(i),ih(i),rh(i),sm(i),im(i));
    d1 = h*Rh_xy(t(i),sh(i),eh(i),ih(i),rh(i),sm(i),im(i));
    e1 = h*Sm_xy(t(i),sh(i),eh(i),ih(i),rh(i),sm(i),im(i));
    f1 = h*Im_xy(t(i),sh(i),eh(i),ih(i),rh(i),sm(i),im(i));
    
    a2 = h*Sh_xy(t(i)+h/2,sh(i)+a1/2,eh(i)+b1/2,ih(i)+c1/2,rh(i)+d1/2,sm(i)+e1/2,im(i)+f1/2);
    b2 = h*Eh_xy(t(i)+h/2,sh(i)+a1/2,eh(i)+b1/2,ih(i)+c1/2,rh(i)+d1/2,sm(i)+e1/2,im(i)+f1/2);
    c2 = h*Ih_xy(t(i)+h/2,sh(i)+a1/2,eh(i)+b1/2,ih(i)+c1/2,rh(i)+d1/2,sm(i)+e1/2,im(i)+f1/2);
    d2 = h*Rh_xy(t(i)+h/2,sh(i)+a1/2,eh(i)+b1/2,ih(i)+c1/2,rh(i)+d1/2,sm(i)+e1/2,im(i)+f1/2);
    e2 = h*Sm_xy(t(i)+h/2,sh(i)+a1/2,eh(i)+b1/2,ih(i)+c1/2,rh(i)+d1/2,sm(i)+e1/2,im(i)+f1/2);
    f2 = h*Im_xy(t(i)+h/2,sh(i)+a1/2,eh(i)+b1/2,ih(i)+c1/2,rh(i)+d1/2,sm(i)+e1/2,im(i)+f1/2);
    
    a3 = h*Sh_xy(t(i)+h/2,sh(i)+a2/2,eh(i)+b2/2,ih(i)+c2/2,rh(i)+d2/2,sm(i)+e2/2,im(i)+f2/2);
    b3 = h*Eh_xy(t(i)+h/2,sh(i)+a2/2,eh(i)+b2/2,ih(i)+c2/2,rh(i)+d2/2,sm(i)+e2/2,im(i)+f2/2);
    c3 = h*Ih_xy(t(i)+h/2,sh(i)+a2/2,eh(i)+b2/2,ih(i)+c2/2,rh(i)+d2/2,sm(i)+e2/2,im(i)+f2/2);
    d3 = h*Rh_xy(t(i)+h/2,sh(i)+a2/2,eh(i)+b2/2,ih(i)+c2/2,rh(i)+d2/2,sm(i)+e2/2,im(i)+f2/2);
    e3 = h*Sm_xy(t(i)+h/2,sh(i)+a2/2,eh(i)+b2/2,ih(i)+c2/2,rh(i)+d2/2,sm(i)+e2/2,im(i)+f2/2);
    f3 = h*Im_xy(t(i)+h/2,sh(i)+a2/2,eh(i)+b2/2,ih(i)+c2/2,rh(i)+d2/2,sm(i)+e2/2,im(i)+f2/2);
    
    a4 = h*Sh_xy(t(i)+h/2,sh(i)+a3/2,eh(i)+b3/2,ih(i)+c3/2,rh(i)+d3/2,sm(i)+e3/2,im(i)+f3/2);
    b4 = h*Eh_xy(t(i)+h/2,sh(i)+a3/2,eh(i)+b3/2,ih(i)+c3/2,rh(i)+d3/2,sm(i)+e3/2,im(i)+f3/2);
    c4 = h*Ih_xy(t(i)+h/2,sh(i)+a3/2,eh(i)+b3/2,ih(i)+c3/2,rh(i)+d3/2,sm(i)+e3/2,im(i)+f3/2);
    d4 = h*Rh_xy(t(i)+h/2,sh(i)+a3/2,eh(i)+b3/2,ih(i)+c3/2,rh(i)+d3/2,sm(i)+e3/2,im(i)+f3/2);
    e4 = h*Sm_xy(t(i)+h/2,sh(i)+a3/2,eh(i)+b3/2,ih(i)+c3/2,rh(i)+d3/2,sm(i)+e3/2,im(i)+f3/2);
    f4 = h*Im_xy(t(i)+h/2,sh(i)+a3/2,eh(i)+b3/2,ih(i)+c3/2,rh(i)+d3/2,sm(i)+e3/2,im(i)+f3/2);
    
    sh(i+1) = sh(i)+(a1+2*(a2+a3)+a4)/6;
    eh(i+1) = eh(i)+(b1+2*(b2+b3)+b4)/6;
    ih(i+1) = ih(i)+(c1+2*(c2+c3)+c4)/6;
    rh(i+1) = rh(i)+(d1+2*(d2+d3)+d4)/6;
    sm(i+1) = sm(i)+(e1+2*(e2+e3)+e4)/6;
    im(i+1) = im(i)+(f1+2*(f2+f3)+f4)/6;
end
output={sh,eh,ih,rh,sm,im};
figure
hold on
plot(t,sh)
plot(t,eh)
plot(t,ih)
plot(t,rh)
plot(t,sm)
plot(t,im)
hold off