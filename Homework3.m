%% System Simulation
% * Homework 3: Buck Converter- Transfer Function Approach
% * Joshua Newman
% * jrn54@uakron.edu
% * 1/23/2021
% 
%%
clc; clear; close all;

timeSample = .00015; % 2/|-125 - 5769.26*i = T < .000347
tfinal=.075;
Tvec= [-2*timeSample:timeSample:tfinal];
N= length(Tvec);

%Initialized Systems
sys1 = zeros(1,N);
sys2 = zeros(1,N);

%Coefficients
A1=4/3*1e7;
A2=4*1e8;
B=1;
C=250;
D=3.33*1e7;
z= tf('z');

%Exact Function
SysExact1 = tf(A1, [B C D]);
SysExact2 = tf(A2, [B C D]);

%Unit Steps
uA=12*ones(1,N);
uA(1)=0;
uA(2)=0;
uB = .4 * ones(1,N);
uB(1) =0;
uB(2) =0;

%Numerators
num1= A1*timeSample^2;
numB1= A2*timeSample^2;
num2= 2*A1*timeSample^2;
numB2= 2*A2*timeSample^2;
num3= A1*timeSample^2;
numB3= A2*timeSample^2;

%Denominators
Den1 = (4+2*C*timeSample+D*timeSample^2);
Den2 = (-8+2*D*timeSample^2);
Den3 = 4-2*C*timeSample+D*timeSample^2;


%Looping
for k=1: N-2
    sys1(k+2) = (-(Den2*sys1(k+1) + (Den3)*sys1(k))+(num1)*uA(k+2)+(num2)*uA(k+1)+(num3)*uA(k))/(Den1);
    sys2(k+2) = (-(Den2*sys2(k+1) + (Den3)*sys2(k))+(numB1)*uB(k+2)+(numB2)*uB(k+1)+(numB3)*uB(k))/(Den1);  
end

%% *Plots*
figure
hold on
xlim([0 tfinal])
plot(Tvec, sys1, 'r')
step(12*SysExact1, tfinal)
legend('Tustin Approx-PartA', 'Exact-PartA')
hold off

figure
hold on
xlim([0 tfinal])
plot(Tvec, sys2, 'r')
step(0.4*SysExact2, tfinal)
legend('Tustin Approx-PartB', 'Exact-PartB')
hold off




