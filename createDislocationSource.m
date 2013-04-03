function dsrc = createDislocationSource (bvec, lvec, fpos, tauc)
%% dsrc = createDislocationSource (bvec, lvec, fpos, tauc)
%  Returns in dsrc a dislocation with the attributes specified.
%  bvec Burgers vector; 1x3 vector
%  lvec Line vector;    1x3 vector
%  fpos Fractional position along slip-plane; scalar
%  tauc Critical stress for dislocation dipole nucleation; scalar

    %% Populate data
    dsrc.b = bvec;
    dsrc.l = lvec;
    dsrc.f = fpos;
    dsrc.t = tauc;
end
