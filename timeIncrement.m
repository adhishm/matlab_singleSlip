function globalTimeIncrement = timeIncrement (dList, dislocationPosition, velocityList, ...
                                            limitingDistance, limitingTimeStep)
%% globalTimeIncrement = timeIncrement (dList, dislocationPosition, velocityList, ...
%                                           limitingDistance, limitingTimeStep)
%  Calculates the time increment based on the limiting distance up to which
%  one dislocation approach another. Beyond this, both dislocations are
%  pinned.

    %% Find out number of dislocations
    
    nDisl = length (dList);
    
    %% Iterate dislocations
    
    % Distance between this dislocation and others
    % vector (3), norm
    distanceVectors = zeros(nDisl, 4);
    velocityVectors = zeros(nDisl, 4);
    idealTime       = zeros(nDisl, nDisl);
    minTimeVector   = zeros(nDisl, 2);
    
    for i=1:nDisl
        
        %unitV = velocityList(i,:)/norm(velocityList(i,:));  % Unit vector for velocity
        
        for j=1:nDisl
            if (i~=j)
                distanceVectors (j, 1:3) = dislocationPosition (j,:) - dislocationPosition (i,:);
                distanceVectors (j, 4)   = norm (distanceVectors (j, 1:3));
                velocityVectors (j, 1:3) = velocityList (j,:) - velocityList (i,:);
                velocityVectors (j, 4)   = norm (velocityVectors (j, 1:3));
                idealTime(j, i) = (limitingDistance - distanceVectors(j,4))/velocityVectors(j,4);
            else
                idealTime(i,j) = 1000.0;    % Some huge number
            end
        end
        % Find minimum time
        [ minTimeVector(i, 2), minTimeVector(i,1) ] = min(idealTime(i,:));
        if (minTimeVector(i,2) < limitingTimeStep)
            minTimeVector(i,2) = limitingTimeStep;
            minTimeVector(i,1) = 0;
        end
    end
    
    globalTimeIncrement = min(minTimeVector(:,2));
    
end
    
    