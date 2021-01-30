%% System Simulation
% * Homework 4: State-Space Representation for an RLC Circuit
% * Joshua Newman
% * jrn54@uakron.edu
% * 1/30/2021
% 
%%
clc; clear;

%Component values
R1= 500;
R2= 1000;
R3= 1000;
C1= 4.7*1e-6;
C2= 4.7*1e-6;
C3= 4.7*1e-6;
L= 2;
%%
%Establishing component values into our matrices
A = [ -1/(R2*C1), 1/(R2*C1), 0, 1/C1;...
        1/(R2*C2), -(1/(R2*C2)+1/(R3*C2)), 1/(R3*C2), 0;...
        0, 1/(R3*C3), -1/(R3*C3), 0;...
        -1/L, 0, 0, -R1/L];
    
B = [ 0; 0; 0; 1/L];

C = [ 0 0 1 0];
D= 0;
  
% State-Space Equation to Transfer Function
[b,a] = ss2tf(A, B, C, D);
transferFunc = tf(b,a)

%%
%Finding Eigen Values and Poles of Transfer Function
eigenValues = eig(transferFunc)
Poles = pole(transferFunc)




