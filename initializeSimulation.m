%% initializeSimulation.m
%  This script initializes variables for the simulation. Mention input
%  files, material properties and simulation parameters here.

%% Input files
dislocationStructureFile = 'dislList.txt';
dislocationSourceFile    = 'dsourceList.txt';

%% Slip plane
extremities = [ 0  0  0;
                50 50 50 ];
fpos = 0.5;

%% Material properties
dragCoefficient = 1.0e09;               % Kg/s
criticalStressDipoleEmission = 1.0e10;  % Pa
BurgersVector = 5.0e-09;                % m
mu = 1.0e9;                             % Pa
nu = 0.33;

%% Simulation parameters
limitingTimeStep = 1.0e-12;                    % s
limitingDistance = 2.0 * BurgersVector;

turnsDislocationSource = 10;

appliedStress = 1.0e09 *  [ 0 0 0;
                            0 1 0;
                            0 0 0 ];    % Pa
stoppingCriterion = 1;                  % 1: Number of steps; 2: time
limitingSteps     = 1000;               % Number of steps
limitingTime      = 1.0;                % Total time limit
