function [matingpairs, select] = Reproduce(popn, fitness)
    % Reproduce function uses the roulette wheel selection to
    % produce mating pairs for crossover. “select” contains
    % the number of each string in the popn that had been
    % added to the mating pool.
    normfit = fitness/sum(fitness);
    partsum = 0;
    randnums = rand(size(fitness));
    count(1) = 0; 
    matepool=[];
    for i=1:length(fitness)
        partsum = partsum+normfit(i);
        count(i+1) = length(find(randnums<partsum));
        select(i,1) = count(i+1)-count(i);
        matepool = [matepool;ones(select(i, 1), 1)*popn(i, :)];
    end
    [~, mating] = sort(rand(size(matepool, 1), 1));
    matingpairs = matepool(mating, :);
end