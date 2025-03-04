%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File: circular.m
% See main.m for more information
% Author: Mario Ruz, 2025.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;
clear all;
N = 1:20;     
a=input('Introduce average radius of the coil (in cm)--> ');
b=input('Introduce winding thickness (in cm)--> ');
h=input('Introduce winding height (in cm) --> ');
for i = 1:20
   L(i) = 0.31*(a*N(i))^2/(6*a+9*h+10*b);   
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
