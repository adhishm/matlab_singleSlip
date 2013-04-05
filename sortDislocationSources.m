function dsourceSorted = sortDislocationSources (dsourceList)
%% dSorted = sortDislocations (dList)
%  Sorts the dislocation sources in dsourceList the ascending order of
%  their position along the slip plane and returns the sorted list in
%  dsourceSorted.

    %% Create vector with fractional positions
    nDisl = size(dsourceList,2);
    fvec = zeros (nDisl, 1);
    % Populate with positions
    for i=1:nDisl
        fvec(i) = dsourceList(i).f;
    end
    
    %% Sort fvec in ascending order
    [fvals, findex] = sort(fvec, 'ascend');
    
    %% Populate dSorted
    dsourceSorted = dsourceList; % Preallocate
    for i=1:nDisl
        dsourceSorted(i) = dsourceList(findex(i));
    end
end
