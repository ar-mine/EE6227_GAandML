function xpopn = Decode(popn)
% Decode function converts a population 
% (popn) of strings from binary to integer
% assuming variables are non-negative.
    lbits = size(popn, 2);
    twopowers = 2.^(lbits-1:-1:0);
    xpopn = popn*twopowers.';
end