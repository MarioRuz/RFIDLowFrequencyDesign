%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File: rectangular.m
% see main.m for more information
% Author: Mario Ruz, 2025.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                           								
% Example
%x = 28;			% width of coil 
%y = 34;			% length 
%b = 1.5;           % width of cross section					      
%h = 0.03;          % height						   
%***********************************************************
%					--------------                         *
%					|			 |                         *
%   			 y  |			 |                         *
%   				|	         |                         *
%   		        |			 |                         *
%				    --------------                         *
%                         x                                *
%***********************************************************
%
close all;
clear all;
N = 1:14; % Number of turns		
x=input('Introduce width of coil (cm) --> ');
y=input('Introduce length of coil (cm) --> ');
b=input('Introduce width of cross section (cm) --> ');
h=input('Introduce height (coild build up) of cross section (cm) --> ');
C = x+y+2*h;

for i = 1:14
   L(i)= 0.0276*(C*N(i))^2/(1.908*C+9*b+10*h);	% value in uH
end
perimetro_rectangulo = 2*x+2*y;					%cm
plot(N,L);
legend('Inductance value (uH)')
title('Inductance value of the antenna as a function of the number of turns')
xlabel('Number of turns');
ylabel('Inductance (uH)');
grid on;
value = numbeOfturns(L);
disp('The number of turns that provide the nearest required theoretical inductance is:')
value
