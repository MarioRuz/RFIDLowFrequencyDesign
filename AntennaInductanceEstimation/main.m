%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: This script estimates the antenna inductance
% for three possible plannar geometries: rectangular, circular and spiral
% circular. Additionally, it provides the closest number of turns that
% gives the closest value to 27 uH.
%
% The code consists of five files:
% menu.m: This menu allows selecting the antenna geometry.
%
% rectangular.m: Script that provides the inductance as a function of the 
% number of turns for a planar rectangular coil and the number of turns 
% that gives the closest value to 27 µH.
%
% circular.m: same that rectangular.m for a circular geommetry.
%
% spiral.m: same that rectangular.m for a circular geommetry.
%
% numberOfturns.m: function that provides the number of turns that 
% gives the closest value to 27 uH.
%
% Main Reference:
% Youbok Lee, Microchip Technology. 2003. Antenna Circuit Design for RFID 
% Applications. Ref: DS00710C.
% 
% Author: Mario Ruz, 2025.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;
disp('*****************************************************************************************')
disp('*****************************************************************************************')
disp('Inductance estimation of inductive coupling antennas based on its shape.')
disp('Choose the corresponding geometry by writing the number:')
disp('-------------------------------------------------')
disp('|1.Rectangular coil                             |')
disp('|2.Circular coil                                |')
disp('|3.Spiral coil                                  |')
disp('-------------------------------------------------')
antenna_type=input('--> ');

switch  antenna_type
    case 1,
        rectangular   
    case 2,
        circular
    case 3,
        espiral_circular,
    otherwise('Choose one type of geometry. Example: rectangular')
end
