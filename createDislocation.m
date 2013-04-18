function disl = createDislocation (bvec, lvec, fpos, mobileFlag)
%% disl = createDislocation (bvec, lvec, fpos, mobileFlag)
%  Returns in disl a dislocation with the attributes specified.
%  bvec Burgers vector; 1x3 vector
%  lvec Line vector;    1x3 vector
%  fpos Fractional position along slip-plane; scalar
%  mobileFlag Indiaces whether the dislocation is mobile or not; 0:
%  blocked, 1: mobile.

    %% Populate data
    disl.b = bvec;
    disl.l = lvec;
    disl.f = fpos;
    disl.m = mobileFlag;
end
