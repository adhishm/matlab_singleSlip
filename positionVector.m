function posvec = positionVector (fraction, extremities)
%% posvec = positionVector (fraction, extremities)
%  Returns the position vector of a point lying at a fraction fraction
%  between two extreme points fiven by extremities (2xn matrix, in n-space)

    posvec = extremities(1,:) + ...
        (fraction * (extremities(2,:) - extremities(1,:)));
end
