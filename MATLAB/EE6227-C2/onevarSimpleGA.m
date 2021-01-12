function [xpopn, fitness, meanf, maxf, xopt] = onevarSimpleGA(popnsize, lbits, pc, pm, numgens)
% onevarSimpleGA optimises simple function of 1
% variable coded as unsigned binary integer
    meanfhistory = [ ];
    maxfhistory = [ ];
    xopthistory = [ ];
    % Generate the initial population
    gen = 0;
    popn = Initialise(popnsize, lbits);
    % Obtain fitness statistics for the initial population and save 
    % the history parameters for use in Report
    [xpopn, fitness, xopt, maxf, meanf] = Evaluate(popn, lbits);
    xopthistory=[xopthistory;xopt];
    maxfhistory=[maxfhistory;maxf];
    meanfhistory=[meanfhistory;meanf];
    % Call for a Report on the initial population
    % and the initial population statistics
    Report(gen, popn, xpopn, fitness, meanfhistory, maxfhistory, xopthistory);
    for gen=1:numgens % Main generational loop
        % Reproduce, crossover and mutate
        matingpairs = Reproduce(popn, fitness);
        offspring = Crossover(matingpairs, pc);
        popn = Mutation(offspring, pm);
        % Obtain statistics for the current population
        % and save history parameters for Report.
        [xpopn,fitness,xopt,maxf,meanf]=Evaluate(popn,lbits);
        xopthistory=[xopthistory;xopt];
        maxfhistory=[maxfhistory;maxf];
        meanfhistory=[meanfhistory;meanf];
    end % Main generational loop
    % Call Report to printout the final population
    % and a summary of the population stats over all generations
    gen = numgens;
    Report(gen, popn, xpopn, fitness, meanfhistory, maxfhistory, xopthistory);
    xopt = xopthistory;
    maxf = maxfhistory;
    meanf = meanfhistory;
end