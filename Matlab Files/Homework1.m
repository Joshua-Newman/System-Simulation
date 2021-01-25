%% System Simulation
% * Homework 1: Simulation of a Difference Equation
% * Joshua Newman
% * jrn54@uakron.edu
% * 1/12/2021
% 

%%
% *INITIAL CONDITIONS*
clc; clear; 

x = zeros(1,100); % Pre-Allocate
x(1) =.11; % Initial Condition

alpha = [.80 1.35 2.75 3.20 3.52 3.75 4.0]; %Alpha Array

%%
% *Alpha = .80*
for k = 1:99
    x(k+1) = alpha(1)*(1-x(k))*x(k);
end

plot(x)
title(" Alpha = .80 ODE plot")
xlabel("Samples")
ylabel("x[k]")

%%
% *Alpha = 1.35*
for k = 1:99
    x(k+1) = alpha(2)*(1-x(k))*x(k);
end

plot(x)
title(" Alpha = 1.35 ODE plot")
xlabel("Samples")
ylabel("[k]")

%%
% *Alpha = 2.75*
for k = 1:99
    x(k+1) = alpha(3)*(1-x(k))*x(k);
end

plot(x)
title(" Alpha = 2.75 ODE plot")
xlabel("Samples")
ylabel("x[k]")

%%
% *Alpha = 3.20*
for k = 1:99
    x(k+1) = alpha(4)*(1-x(k))*x(k);
end

plot(x)
title(" Alpha = 3.20 ODE plot")
xlabel("Samples")
ylabel("x[k]")

%%
% *Alpha = 3.52*
for k = 1:99
    x(k+1) = alpha(5)*(1-x(k))*x(k);
end

plot(x)
title(" Alpha = 3.52 ODE plot")
xlabel("Samples")
ylabel("x[k]")

%%
% *Alpha = 3.75*
for k = 1:99
    x(k+1) = alpha(6)*(1-x(k))*x(k);
end

plot(x)
title(" Alpha = 3.75 ODE plot")
xlabel("Samples")
ylabel("x[k]")

%%
% *Alpha = 4.0*
for k = 1:99
    x(k+1) = alpha(7)*(1-x(k))*x(k);
end

plot(x)
title(" Alpha = 4.0 ODE plot")
xlabel("Samples")
ylabel("x[k]")
%%



