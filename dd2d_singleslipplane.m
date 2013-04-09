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
slipPlaneVector = slipPlane.es(1,:) - slipPlane.es(2,:);
normSlipPlaneVector = norm(slipPlaneVector);
SchmidFactor = slipPlaneVector(1)*slipPlaneVector(2)/(normSlipPlaneVector*normSlipPlaneVector);

%% Initiate the figure
figureHandle = figure;

%% Iteration counters
totalTime = 0.0;
totalSteps = 0;
continueSimulation = true;

%% Initialize statistics
if stoppingCriterion==1
    % Number of steps
    nIterations = limitingSteps;
else
    % Time
    nIterations = 1 + (limitingTime/timeStep);
end

stats = cell (nIterations, 5);  % Time, fPK, f_interaction, f_total, velocity

%% Iterate
while continueSimulation
    %% Pre-allocate and calculate dislocationPosition and dSourcePosition vectors
    nDisl = length(dList);
    nDSources = length(dSourceList);
    
    dislocationPosition = zeros(nDisl, 3);
    dSourcePositions = zeros(nDSources, 3);
    for i=1:nDSources
        dislocationPosition(i,:) = positionVector (dList(i).f, slipPlane.es);
        dSourcePositions(i,:) = positionVector (dSourceList(i).f, slipPlane.es);
    end
    
    %% Forces
    % Peach-Koehler force
    f_PK = BurgersVector * dislocation_PKForces(appliedStress, dList);
    % Dislocation interaction force
    f_d  = (BurgersVector * BurgersVector / 1.0e-09) * ...
            dislocation_interactionForce (dList, slipPlane.es, mu, nu);
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
            dList = emitDipole (dSourceList(i), dList, slipPlane.es, tau, mu, nu, BurgersVector);
        end
    end
    
    %% Plot state
    plotState (figureHandle, dislocationPosition, dSourcePositions, slipPlane.es);
    
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
    
    %% Write statistics
    stats{totalSteps,1} = totalTime;
    stats{totalSteps,2} = f_PK;
    stats{totalSteps,3} = f_d;
    stats{totalSteps,4} = f_total;
    stats{totalSteps,5} = velocityList;
    
    disp('Total time'); disp (totalTime);
    disp('#iterations'); disp(totalSteps);
    %pause
end