function force = interactionForce (d, d1, p, p1, mu, nu)
%% force = interactionForce (d, di, l)
%  Returns in force the interaction force vector experienced by the
%  dislocation d due to the dislocation d1.
%  d  Dislocation on which the force is to be calculated
%  d1 Dislocation whose effect is calculated
%  p  Position vector of the dislocation d
%  p1 Position vector of the dislocation di
%  mu Shear modulus
%  nu Poisson's ratio

    %% Calculate the distance vector
    ri = p - p1;
    norm_ri = norm(ri);
    
    %% Sanity check
    if norm_ri==0
        force = [0 0 0];
        return
    end
    
    %% Calculate the force
    force = (mu / (2.0*pi*(1-nu))) * dot(d.b, d1.b) * (ri/(norm_ri*norm_ri));
end
