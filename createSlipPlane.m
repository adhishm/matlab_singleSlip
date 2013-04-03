function slipPlane = createSlipPlane (listDisl, listDislSource, extremities, fpos)
%% slipPlane = createSlipPlane (listDisl, listDislSource, extremities, fpos)
%  Returns in slipPlane a slip plane with the attributes specified.
%  listDisl       List of dislocations (vector of structures)
%  listDislSource List of dislocation sources (vector of structures)
%  extremities    Co-ordinates of the extremities of the slip plane (2x3
%  matrix)
%  fpos Fractional position along slip-plane normal; scalar

    %% Populate data
    slipPlane.ld  = listDisl;
    slipPlane.lds = listDislSource;
    slipPlane.es  = extremities;
    slipPlane.f   = fpos;
end
