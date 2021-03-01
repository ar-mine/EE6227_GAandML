% Initialization
function X = Initialization(D_size, NP, Xmax, Xmin)
    X = repmat(Xmin, NP, 1) + rand(NP, D_size).*repmat((Xmax-Xmin), NP, 1);
end