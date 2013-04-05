function [a, b] = swap (a, b)
%% [a, b] = swap (a, b)
%  Simple function to swap the values in a and b

    %% Swap
    temp = a;
    a = b;
    b = temp;
    clear temp;
end
