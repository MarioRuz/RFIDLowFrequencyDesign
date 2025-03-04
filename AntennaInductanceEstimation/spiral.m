%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File: spiral.m
% see main.m for more information
% Author: Mario Ruz, 2025.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;
clear all;
N = 1:12;   

ri=input('Inner radius of the spiral (cm) --> ');
r0=input('Outer radius of the spiral (cm) --> ');
a = (ri+r0)/2;
b = (r0-ri);

for i = 1:12
   L(i)= 0.3937*(a*N(i))^2/(8*a+11*b);	% value in uH
end
plot(N,L);
legend('Inductance value (uH)')
title('Inductance value of the antenna as a function of the number of turns')
xlabel('Number of turns');
ylabel('Inductance (uH)');
grid on;
value = numbeOfturns(L);
disp('The number of turns that provide the required theoretical inductance is:')
value