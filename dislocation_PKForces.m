function forceList = dislocation_PKForces (stress, dList)
%% forceList = dislocation_PKForces (stress, dList)

    %% Pre-allocate forceList
    nDisl = length(dList);
    forceList = zeros (nDisl, 3);
    
    %% Populate forces
    for i=1:nDisl
        forceList(i,:) = peach_koehler (stress, dList(i).b, dList(i).l);
    end
end
