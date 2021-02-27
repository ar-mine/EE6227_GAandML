% Recombination
function U = Recombination(V, D_size, NP, Cr, X, options)
    if options==0
        % Binominal/uniform Crossover
        j_rand = ceil(rand(1)*D_size);
        Cr_rand_index = rand(NP, D_size)<=Cr;
        U = zeros(NP, D_size);
        U(Cr_rand_index) = V(Cr_rand_index);
        U((~Cr_rand_index)) = X((~Cr_rand_index));
        U(:,j_rand)=V(:,j_rand);
    elseif options==1
        % TODO
        U = 0;
    end
end