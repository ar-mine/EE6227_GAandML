function [xpopn, fitness, xopt, maxf, meanf] = Evaluate(popn, lbits)
% Evaluate function returns the fitness of the current population. 
% 1st this function calls the Decode() and Objfun() functions.
    xpopn = Decode(popn);
    fitness = Objfun(xpopn, lbits);
    meanf = sum(fitness)/size(popn,1);
    [maxf, imax] = max(fitness); % imax is the index of the fittest.
    xopt = xpopn(imax); % xopt is the best value at current generation
end

