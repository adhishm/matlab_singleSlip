function disl = createDislocation (bvec, lvec, fpos)
%% disl = createDislocation (bvec, lvec, fpos)
%  Returns in disl a dislocation with the attributes specified.
%  bvec Burgers vector; 1x3 vector
%  lvec Line vector;    1x3 vector
%  fpos Fractional position along slip-plane; scalar

    %% Populate data
    disl.b = bvec;
    disl.l = lvec;
    disl.f = fpos;
end
