% Define the parameter values
beta1 = 1/730;
alpham = 0.13;
alphah = 0.027;
gemma1 = 0.020;   
si = 0.038;
beta2 = 0.001;
exi = 0.13;
gemma3 = 0.072;
gemma2 = 0.010;
eatah = 0.0004;
delta2 = 0.001;
delta1 = 0.001;
p = 0.611;
epsilon = 0.05;
eatam = 0.02;
v = 0.01;
e = 0.022;
sigma = 0.03;

% Define the system of differential equations
dsh_dx = @(x,sh,eh,ih,rh,sm,im) alphah + beta1*rh - gemma1*si*ih*sh - gemma2*exi*im*sh - (delta1+eatah)*sh;
deh_dx = @(x,sh,eh,ih,rh,sm,im) gemma2*exi*im*sh + gemma1*si*ih*sh - (beta2+delta2+eatah)*eh;
dih_dx = @(x,sh,eh,ih,rh,sm,im) beta2*eh - (epsilon+p*v+eatah)*ih;
drh_dx = @(x,sh,eh,ih,rh,sm,im) delta1*sh + p*v*ih + delta2*eh - (beta1+eatah)*rh;
dsm_dx = @(x,sh,eh,ih,rh,sm,im) alpham - (sigma+eatam)*sm - gemma3*e*sm*ih;
dim_dx = @(x,sh,eh,ih,rh,sm,im) gemma3*e*ih*sm - (sigma+eatam)*im;

% Combine the differential equations into a single function
odefun = @(x,y) [dsh_dx(x,y(1),y(2),y(3),y(4),y(5),y(6));
                deh_dx(x,y(1),y(2),y(3),y(4),y(5),y(6));
                dih_dx(x,y(1),y(2),y(3),y(4),y(5),y(6));
                drh_dx(x,y(1),y(2),y(3),y(4),y(5),y(6));
                dsm_dx(x,y(1),y(2),y(3),y(4),y(5),y(6));
                dim_dx(x,y(1),y(2),y(3),y(4),y(5),y(6))];

% Set the initial conditions
initial_conditions = [3; 6; 1; 4; 2; 5];

% Define the integration interval
xspan = [0 5000];

% Solve the system of differential equations
[x, y] = ode45(odefun, xspan, initial_conditions);

% Extract the individual solutions
sh = y(:, 1);
eh = y(:, 2);
ih = y(:, 3);
rh = y(:, 4);
sm = y(:, 5);
im = y(:, 6);

% Plot the solutions
figure;
plot(x, sh, 'r', x, eh, 'g', x, ih, 'b', x, rh, 'm', x, sm, 'c', x, im, 'k');
legend('sh', 'eh', 'ih', 'rh', 'sm', 'im');
xlabel('x');
ylabel('Solution');
title('Solution Curves');

% Note: You may need to adjust the plot settings and labels based on your specific needs.