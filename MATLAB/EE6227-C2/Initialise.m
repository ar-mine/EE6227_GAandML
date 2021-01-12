function [popn] = Initialise(popnsize,lbits)
% Generate the initial population
    popn=rand(popnsize, lbits) < 0.5;
end

