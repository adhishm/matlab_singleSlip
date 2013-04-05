%% initializeSimulation.m
%  This script initializes variables for the simulation. Mention input
%  files, material properties and simulation parameters here.

%% Input files
dislocationStructureFile = 'dislList.txt';
dislocationSourceFile    = 'dsourceList.txt';

%% Slip plane
extremities = [ 0 0 0;
                5 5 5 ];
fpos = 0.5;

%% Material properties
dragCoefficient = 1.0;                  % Kg/s
criticalStressDipoleEmission = 1.0;     % Pa
mu = 1.0e9;                             % Pa
nu = 0.33;

%% Simulation parameters
timeStep = 10.0e-09;                    % s
appliedStress = [ 0 0 0;
                  0 0 0;
                  0 0 1 ];              % Pa
stoppingCriterion = 1;                  % 1: Number of steps; 2: time
limitingSteps     = 1000;               % Number of steps
limitingTime      = 1.0;                % Total time limit
