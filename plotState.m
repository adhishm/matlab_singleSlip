function plotState (figureHandle, dislocationPosition, dSourcePositions, slipPlane)
%% plotState (dislocationPosition, dSourceList, slipPlane)
%  Plots the state of the simulation given the position vectors of the
%  dislocations, the sources and the slip plane

    %% Initiate figure
    figure(figureHandle);
    hold on
    
    %% Draw slip plane
    plot3 (slipPlane(:,1), slipPlane(:,2), slipPlane(:,3), '-r');
    
    %% Draw dislocations
    plot3 (dislocationPosition(:,1), dislocationPosition(:,2), dislocationPosition(:,3), 'xk');
    
    %% Draw dislocation sources
    plot3 (dSourcePositions(:,1), dSourcePositions(:,2), dSourcePositions(:,3), 'ob');
    hold off
    
    axis equal
end
