function velocityList = dislocationVelocities (totalForce, dragCoefficient)
%% velocityList = dislocationVelocities (dList, totalForce)
%  Returns in velocityList the list of velocities of the dislocations, due
%  to the total force given in totalForce (the sum of the Peach-Koehler
%  forces and the interaction forces).

    %% Calculate the force
    velocityList = totalForce/dragCoefficient;
    
end
