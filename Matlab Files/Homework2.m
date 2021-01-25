%% System Simulation
% * Homework 2: SR-71 Supersonic Inlet
% * Joshua Newman
% * jrn54@uakron.edu
% * 1/22/2021
% 
%%
% Initial Conditions
clc; clear;
T = 0.003;

%Setting up variables for Hc(S) approximation
A = 50;
B = 33.3333;
C = 13333.3;
D = 185.333;
E = 12133.3;
F = 693333;

%Initializing our s and z so we can use them in our transfer function
s = tf('s');
z = tf('z',T);

%Setting up Transfer Function
Hc_s = (A*(-s^2 + B*s + C))/ (s^3 + D*s^2 + E*s + F);

%Setting up Madwed Substitutions
madwedOne = (T*(z+1))/(2*(z-1));
madwedTwo = ((T^2)*(z^2+4*z+1))/(6*(z-1)^2);
madwedThree = ((T^3)*(z^3+11*z^2+11*z+1))/(24*(z-1)^3);

%Madwed Approximation
Hm = (A*(-madwedOne + B*madwedTwo + C*madwedThree))/(1 + D*madwedOne + E*madwedTwo + F*madwedThree)

%Numerator Coefficients
G = -5951;
H = 6.109e04;
I = -2.757e05;
J = 7.08e05;
K = -1.099e06;
L = 9.413e05;
M = -1.219e05;
N = -7.472e05;
O = 1.005e06;
P = -6.872e05;
Q = 2.782e05;
R = -6.358e04;
S = 6366;

%Denominator Coefficients
GG = 1;
HH = -1.235e06;
II = 6.495e06;
JJ = -2069e07;
KK = 4.45e07;
LL = -6.8e07;
MM = 7.57e07;
NN = -6.179e07;
OO = 3.694e07;
PP = -1.565e07;
QQ = 4.472e06;
RR = -7.739e05;
SS = 6.133e04;

%Coefficient Arrays
NC = [ G H I J K L M N O P Q R S];
DC = [ GG HH II JJ KK LL MM NN OO PP QQ RR SS];

%Difference Equation
sys = idpoly(DC, NC, 'NoiseVariance', 1)



%%
%Plots of Impulse and Step Responses

%Impulse Response of Original Function
figure(1)
impulse(Hc_s, 0.25)
%Step Response of Original Function
figure(2)
step(Hc_s, 0.25)

%Impulse Reponse of Madwed Approximation
figure(3)
impulse(Hm, 0.25)
%Step Reponse of Madwed Approximation
figure(4)
step(Hm, 0.25)

%I was not able to plot my difference equation..


