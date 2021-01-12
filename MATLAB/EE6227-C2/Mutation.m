function newpopn=Mutation(offspring, pm)
    mutate = find(rand(size(offspring)) < pm);
    % mutate has positions of genes to be mutated.
    newpopn = offspring;
    newpopn(mutate) = 1-offspring(mutate);
end