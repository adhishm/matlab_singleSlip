function globalTimeIncrement = timeIncrement (dList, dSourceList, dislocationPosition, dSourcePositions, velocityList, limitingDistance)
%% globalTimeIncrement = timeIncrement (dList, dSourceList, dislocationPosition, dSourcePositions, velocityList, limitingDistance)
%  Calculates the time increment based on the limiting distance up to which
%  one dislocation approach another. Beyond this, both dislocations are
%  pinned.

