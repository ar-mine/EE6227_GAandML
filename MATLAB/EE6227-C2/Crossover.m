function offspring = Crossover(popn, pc)
    lbits = size(popn,2);
    sites = ceil(rand(size(popn,1)/2,1) * (lbits-1));
    sites = sites .* (rand(size(sites)) < pc); % crossover probability
    for j=1:length(sites)
        offspring(2*j-1, :)=[popn(2*j-1,1:sites(j)) popn(2*j, sites(j)+1:lbits)];
        offspring(2*j, :)=[popn(2*j,1:sites(j)) popn(2*j-1, sites(j)+1:lbits)];
    end
end