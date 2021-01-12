function fitness = Objfun(xpopn,lbits)
% Objfun evaluates the objective/fitness 
% values of a decoded population
% This example is f(x)=(x/c)^10, where
% c=2^lbits-1;
    c = 2^lbits-1;
    fitness = (xpopn/c).^10;
end