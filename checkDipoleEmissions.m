function flag = checkDipoleEmissions (tau, dSources)
%% flag = checkDipoleEmissions (tau, dSources)
%  Returns a vector of flags indicating whether each dislocation source
%  present in the list dSources will emit a dislocation dipole or not.

    %% Check for dipole emission criterion
    
    nSources = length(dSources);
    flag = zeros(1, nSources);
    
    for i=1:nSources
        if tau > dSources(i).t
            flag(i) = true;
        else
            flag(i) = false;
        end
    end
end
