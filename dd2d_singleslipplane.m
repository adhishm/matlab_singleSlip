%% dd2d_singleslipplane.m
%  This script initializes all variables required, and then carries out the
%  simulation of dislocation dynamics on a single slip plane.

%% Initialize simulation parameters
initializeSimulation;

%% Load data from files
dList = readDislocationList ( dislocationStructureFile );
dSourceList = readDislocationSourceList ( dislocationSourceFile );
nDisl = length(dList);
nDSources = length(dSourceList);

%% Slip plane
slipPlane = createSlipPlane (dList, dSourceList, extremities, fpos);
slipPlaneVector = slipPlane.es(1,:) - slipPlane.es(2,:);
normSlipPlaneVector = norm(slipPlaneVector);
SchmidFactor = slipPlaneVector(1)*slipPlaneVector(2)/(normSlipPlaneVector*normSlipPlaneVector);

%% Pre-allocate and calculate dislocationPosition vector
dislocationPosition = zeros(nDisl, 3);
for i=1:nDisl
    dislocationPosition(i,:) = positionVector (dList(i).f, slipPlane.es);
end

%% Iteration counters
totalTime = 0.0;
totalSteps = 0;
continueSimulation = true;

%% Iterate
while continueSimulation
    %% Forces
    % Peach-Koehler force
    f_PK = dislocation_PKForces(appliedStress, dList);
    % Dislocation interaction force
    f_d  = dislocation_interactionForce (dList, slipPlane.es, mu, nu);
    % Total force
    f_total = f_PK + f_d;
    
    %% Dislocations velocities
    velocityList = dislocationVelocities (f_total, dragCoefficient);
    
    %% Move the dislocations
    % Initial absilute position vector
    dislocationPosition = dislocationPosition + (velocityList * timeStep) ;
    for i=1:nDisl
        % Calculate fractional position
        dList(i).f = norm(dislocationPosition(i,:) - slipPlane.es(1,:))/normSlipPlaneVector;
    end
    
    %% Dislocation dipole emissions
    % Resolved shear stress
    tau = ( (appliedStress(1,1)+appliedStress(2,2)) * SchmidFactor ) + appliedStress(1,2);
    dipoleEmissions = checkDipoleEmissions (tau, dSourceList);
    for i=1:nDSources
        if (dipoleEmissions(i))
            dList = emitDipole (dSourceList(i), dList, slipPlane.es, tau. mu, nu, BurgersVector);
        end
    end
    
    %% Plot state
    
    %% Simulation parameters
    % Time step
    totalTime = totalTime + timeStep;
    % Number of iterations
    totalSteps = totalSteps + 1;
    % Stopping criterion
    if stoppingCriterion==1
        % Number of steps
        if totalSteps >= limitingSteps
            continueSimulation = false;
        end
    else
        % Total time
        if totalTime >= limitingTime
            continueSimulation = false;
        end
    end
end