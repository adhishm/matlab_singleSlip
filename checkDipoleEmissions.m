function flag = checkDipoleEmissions (tau, dSources, turnsDislocationSource)
%% flag = checkDipoleEmissions (tau, dSources, turnsDislocationSource)
%  Returns a vector of flags indicating whether each dislocation source
%  present in the list dSources will emit a dislocation dipole or not.

    %% Check for dipole emission criterion
    
    nSources = length(dSources);
    flag = zeros(1, nSources);
    
    for i=1:nSources
        if tau > dSources(i).t
            dSources(i).s = dSources(i).s + 1;  % Add a turn to the counter
            if dSources(i).s == turnsDislocationSource
                % The limiting number of turns is reached
                flag(i) = true;
                dSources(i).s = 0;
            end
        else
            flag(i) = false;
        end
    end
end
