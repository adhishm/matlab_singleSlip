function force = peach_koehler (stress, bvec, lvec)
%% force = peach_koehler (stress, bvec, lvec)
%  Returns in the vector force, the Peach-Koehler force vector acting on
%  the dislocation with Burgers vector bvec and line vector lvec, due to
%  the applied stress stress.

    %% Calculate the Peach-Koehler force
    v = cross(bvec, lvec);  % Cross product
    force = (stress * v')';
end
    