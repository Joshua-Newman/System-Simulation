%% System Simulation
% * Homework 5: Phase-Plane Plots for the Pendulum
% * Joshua Newman
% * jrn54@uakron.edu
% * 2/10/2021
% 
%%
clc; clear; close all;
%%
% *Part A (Used with Dr. Adams Given Code)*

T=0.1;              %Simulation Time Step
tfinal=100;          %Simulation Final Time

theta=3.14159265358979;         %Initial Pendulum Angle
omega=0;            %Initial Pendulum Angular Velocity

a=1;                %Pendulum Parameter a=g/el
b=0.5;             %Pendulum Parameter b=mu/m

%=============DO NOT CHANGE BELOW THIS LINE======================
%Create the Time Vector
tvec=[0:T:tfinal];
N=length(tvec);

%Allocate Memory
x=zeros(2,N);
f=zeros(2,N);
clf

%Set Initial Conditions
x(:,1)=[theta omega]';

for k=1:N-1
    %Derivative Calculation
    f(1,k)=x(2,k);
    f(2,k)=-a*sin(x(1,k)) - b*x(2,k);
    
    %Integrator
    x(:,k+1)=x(:,k)+T*f(:,k);
end

x=x/pi;         %Normalize to fractions of pi radians
x1min=min(x(1,:));
x2min=min(x(2,:));

x1max=max(x(1,:));
x2max=max(x(2,:));

for k=1:N-1
    subplot(221)
    grid on
    hold on
    plot(tvec(k:k+1),x(2,k:k+1))
    axis([0 tfinal x2min x2max])
    xlabel('t')
    ylabel('x_2')
    hold off
    subplot(224)
    grid on
    hold on
    plot(x(1,k:k+1),tvec(k:k+1))
    axis([x1min x1max 0 tfinal])
    xlabel('x_1')
    ylabel('t')
    hold off
    subplot(222)
    grid on
    hold on
    plot(x(1,k:k+1),x(2,k:k+1))
    axis([x1min x1max x2min x2max])
    hold off
    
end
%%
% *Part B* 

T=.1;
Tfinal = 30;
Ninit = 500;
maginit = 3;
a=1;               %Pendulum Parameter a=g/el
b=0.5;             %Pendulum Parameter b=mu/m

Tvec= [0:T:Tfinal];
N = length(Tvec);

%Allocate Memory
x = zeros(2,N);
f = zeros(2,N);

%Create Initial Conditions
theta = linspace(0, 2*pi, Ninit+1);
xinit=[maginit*cos(theta(1:Ninit));maginit*sin(theta(1:Ninit))];



for m=1:Ninit
    x(:,1)=xinit(:,m);
    for k=1:N-1
        
        %Derivative Calculation
        f(1,k)=x(2,k);
        f(2,k)=-a*sin(x(1,k)) - b*x(2,k);
    
        %Integrator
        x(:,k+1)=x(:,k)+T*f(:,k);
    end
    
    
    x=x/pi;             %Normalize to fractions of pi radians
    x1min=-pi;
    x2min=-pi;
    x1max=pi;
    x2max=pi;

    %Plotting
    subplot(221)
    grid on
    hold on
    plot(Tvec,x(2,:))
    axis([0 Tfinal x2min x2max])
    xlabel('t')
    ylabel('x_2')
    hold off
    subplot(224)
    grid on
    hold on
    plot(x(1,:),Tvec)
    axis([x1min x1max 0 Tfinal])
    xlabel('x_1')
    ylabel('t')
    hold off
    subplot(222)
    grid on
    hold on
    plot(x(1,:),x(2,:))
    axis([x1min x1max x2min x2max])
    hold off

end
%%
%Part C

T=.1;
Tfinal = 20;
Ninit = 125;
maginit = 3;
a=1;               %Pendulum Parameter a=g/el
b=0.5;             %Pendulum Parameter b=mu/m

Tvec= [0:T:Tfinal];
N = length(Tvec);

%Allocate Memory
x = zeros(2,N);
f = zeros(2,N);

%Create Initial Conditions
X= [linspace(-3,3,Ninit), 3*ones(1,Ninit), linspace(3,-3,Ninit), -3*ones(1,Ninit)];
Y= [3*ones(1,Ninit), linspace(3,-3, Ninit), -3*ones(1,Ninit), linspace(-3,3,Ninit)];
xinit= [X;Y];

for m=1: Ninit*4
    x(:,1)=xinit(:,m);
    for k=1:N-1     
        %Derivative Calculation
        f(1,k)=x(2,k);
        f(2,k)=-a*sin(x(1,k)) - b*x(2,k);
        %Integrator
        x(:,k+1)=x(:,k)+T*f(:,k);
    end 
    
    x=x/pi;    %Normalize to fractions of pi radians
    x1min=-pi;
    x2min=-pi;
    x1max= pi;
    x2max= pi;

    %Plotting
    subplot(221)
    grid on
    hold on
    plot(Tvec,x(2,:))
    axis([0 Tfinal x2min x2max])
    xlabel('t')
    ylabel('x_2')
    hold off
    subplot(224)
    grid on
    hold on
    plot(x(1,:),Tvec)
    axis([x1min x1max 0 Tfinal])
    xlabel('x_1')
    ylabel('t')
    hold off
    subplot(222)
    grid on
    hold on
    plot(x(1,:),x(2,:))
    axis([x1min x1max x2min x2max])
    hold off

end