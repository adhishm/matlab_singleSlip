function dSorted = sortDislocations (dList)
%% dSorted = sortDislocations (dList)
%  Sorts the dislocations in dList the ascending order of their position
%  along the slip plane and returns the sorted list in dSorted.

    %% Create vector with fractional positions
    nDisl = size(dList,2);
    fvec = zeros (nDisl, 1);
    % Populate with positions
    for i=1:nDisl
        fvec(i) = dList(i).f;
    end
    
    %% Sort fvec in ascending order
    [fvals, findex] = sort(fvec, 'ascend');
    
    %% Populate dSorted
    dSorted = dList; % Preallocate
    for i=1:nDisl
        dSorted(i) = dList(findex(i));
    end
end
