% Initialization
function [X, V] = Initialization(D_size, NP)
    global Xmax Xmin Vmax
    X = repmat(Xmin, NP, 1) + rand(NP, D_size).*repmat((Xmax-Xmin), NP, 1);
    V = repmat(-Vmax, NP, 1) + rand(NP, D_size).*repmat(2*Vmax, NP, 1);
end