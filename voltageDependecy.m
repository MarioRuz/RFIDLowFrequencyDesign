%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: This script plots the voltage dependency from the averaged
% distance detection at the point of operation.
% Two representative examples are used: at velocities of 250 mm/s and
% 500 mm/s, within the range 7-18 V of power supply.
%
% As can be noted from the figures, there is a dependency between the
% entrance velocity and the power supply.
% Author: Mario L. Ruz (mario.ruz@uco.es)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all; clear all
% Test 221121_10, 7 12 y 15 18V power supply TENMAv1 = [7 12 18], 500 mm/s
v2 = [7 12 18]
medio_global2 = [275 366.7 408]
max_opPoint2 = [323 490 513]; 
media_puntoOp2 = [310 424.6 452.7]
min_opPoint2 = [298 383.5 383.5]

figure(1);
plot(v2, media_puntoOp2,'b');
hold on;
grid on
plot(v2, max_opPoint2,'r');
plot(v2, min_opPoint2,'k');
legend;
xlabel('Power voltage (V)');
ylabel('Distance (mm)');
title('Experiment 2, 500 mm/s');

% Test 221121_10, 7 12 y 15 18V power source TENMAv1 = [9 15], 250 mm/s,
v4 = [7 9 12 15 18]
medio_global4 = [323.3 363 412.4 448.4 484.1]
max_opPoint4 = [378 420 503 503 553.11]
media_puntoOp4 = [369 406 467 487.8 516.7]
min_opPoint4 = [349.8 385.8 434 446.47 482.9]

figure(2);
plot(v4, media_puntoOp4,'b');
hold on;
grid on
plot(v4, max_opPoint4,'r');
plot(v4, min_opPoint4,'k');
legend;
xlabel('Power voltage (V)');
ylabel('Distance (mm)');
title('Experiment 4, 250 mm/s');


% Final Figure
figure(3);
plot(v4, max_opPoint4, 'r', 'LineWidth', 2);
hold on;
plot(v4, min_opPoint4, 'b', 'LineWidth', 2);
fill([v4 fliplr(v4)], [max_opPoint4 fliplr(min_opPoint4)],'b', 'FaceAlpha',0.3); hold on;
plot(v4, media_puntoOp4,'k');
title('250 mm/s');
xlabel('Input power voltage (V)');
ylabel('Distance (mm)');
grid on;

plot(v2, max_opPoint2, 'r', 'LineWidth', 2);
hold on;
plot(v2, min_opPoint2, 'b', 'LineWidth', 2);
fill([v2 fliplr(v2)], [max_opPoint2 fliplr(min_opPoint2)],'R', 'FaceAlpha',0.3); hold on;
plot(v2, media_puntoOp2,'k');
grid on;
title('250 mm/s (blue) and 500 mm/s (red)');
xlabel('Input power voltage (V)');
ylabel('Discance (mm)');

% Pearson Analysis
% 250 mm/s
r1 = corrcoef(v4, media_puntoOp4);
r1 = r1(1,2); % Pearson coefficient
fprintf('Pearson coefficient: %.4f\n', r1);

% 500 mm/s
r2 = corrcoef(v2, media_puntoOp2);
r2 = r2(1,2); % Pearson coefficient
fprintf('Pearson coefficient: %.4f\n', r2);

