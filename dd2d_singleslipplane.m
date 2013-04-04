%% dd2d_singleslipplane.m
%  This script initializes all variables required, and then carries out the
%  simulation of dislocation dynamics on a single slip plane.

%% Initialize simulation parameters
initializeSimulation;

%% Load data from files
dList = readDislocationList ( dislocationStructureFile );
dSourceList = readDislocationSourceList ( dislocationSourceFile );

%% Slip plane
slipPlane = createSlipPlane (dList, dSourceList, extremities, fpos);