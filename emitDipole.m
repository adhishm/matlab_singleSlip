function updatedDislocationList = emitDipole (dSource, dList, slipPlaneExtremities, tau, mu, nu, b)
%% updatedDislocationList = emitDipole (dSource, dList, slipPlaneExtremities, tau, mu, nu, b)
%  Returns in updatedDislocationList the new list of dislocations after the
%  emission of a dislocation dipole. This list is sorted.
%  dSource   The dislocation source that will emit the dipole
%  dList     The current list of dislocations
%  slipPlane Extremities Extremities of the slip plane. This is required to
%               place the dislocations appropriately
%  tau       The stress that causes the dipole to be emitted
%  mu        Shear modulus
%  nu        Poisson's ratio
%  b         Burgers vector (scalar, magnitude)

    %% Position of the dislocation source, slip plane vector, Burgers vector
    
    sourcePos = positionVector (dSource.f, slipPlaneExtremities);
    slipPlaneVector = slipPlaneExtremities(1,:) - slipPlaneExtremities(2,:);
    slipPlaneUnitVector = slipPlaneVector / norm(slipPlaneVector);
    
    %% Calculate the length of the dipole
    
    dipoleL = dipoleLength(mu, b, nu, tau);
    
    %% New dislocation positions
    
    % Position vectors
    p1 = sourcePos + ( (dipoleL/2) * slipPlaneUnitVector);
    p2 = sourcePos - ( (dipoleL/2) * slipPlaneUnitVector);
    
    % Fractions
    f1 = norm(p1 - slipPlaneExtremities(1,:))/norm(slipPlaneVector);
    f2 = norm(p2 - slipPlaneExtremities(1,:))/norm(slipPlaneVector);
    
    %% New dislocation Burgers vectors and line vectors
    
    b1 = dSource.b;
    l1 = dSource.l;
    
    b2 = -1.0 * dSource.b;
    l2 = dSource.l;
    
    %% Create new dislocations
    
    d1 = createDislocation (b1, l1, f1, 1);
    d2 = createDislocation (b2, l2, f2, 1);
    
    %% Insert them into the dislocation list
    nDisl = length(dList);
    
    updatedDislocationList = dList;
    updatedDislocationList(nDisl+1) = d1;
    updatedDislocationList(nDisl+2) = d2;
    
    %% Sort the list
    updatedDislocationList = sortDislocations (updatedDislocationList);
    

end
