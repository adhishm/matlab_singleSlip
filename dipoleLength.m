function l = dipoleLength (mu, b, nu, tau)
%% l = dipoleLength (mu, b, nu, tau)
%  Calculates the length of a dipole and returns it in l

    %% Calculate the dipole length
    l = (mu * b) / (2.0 * pi * (1.0 - nu) * tau);
    
end
