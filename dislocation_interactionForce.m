function forceList = dislocation_interactionForce(dList, slipPlaneExtremities, mu, nu)
%% forceList = dislocation_interactionForce(dList, slipPlaneExtremities, mu, nu)
%  Returns the list of total forces experienced by each dislocation due to
%  all other dislocations,
%  dList List of dislocations
%  slipPlaneExtremities Extreme points of the slip plane
%  mu Shear modulus
%  nu Poisson's ratio

    %% Pre-allocate forceList
    nDisl = length(dList);
    forceList = zeros (nDisl, 3);
    
    %% Populate forces
    for i=1:nDisl
        p = positionVector(dList(i).f, slipPlaneExtremities);
        for j=1:nDisl
            p1 = positionVector(dList(j).f, slipPlaneExtremities);
            forceList(i,:) = forceList(i,:) + ...
                interactionForce(dList(i), dList(j), p, p1, mu, nu);
        end
    end
end
