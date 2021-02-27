clc;clear;

% Choose the problem optimized
Prob_index = 2;

global Xmin Xmax;
global history;
[Prob_k, D_size, NP, Xmin, Xmax, r, r_inc] = Parameters(Prob_index);
F = 0.6;
Gen = ceil(5e4/NP)*1;
Cr = 0.8;
options = [0 0 0 0 0 0];

% 30 iterations
for i=1:1
% Initialization
X = Initialization(D_size, NP, Xmax, Xmin);

fprintf('Gen\t\tMean\t\tMedian\t\tSD\t\t\tFit\t\t\t\tBest\t\tWorst\t\tMV\n')
Record(0, X, r, Prob_k);


    for g=1:Gen
        %Mutation
        V = Mutation(X, F);

        % Recombination(Binominal/uniform Crossover)
        U = Recombination(V, D_size, NP, Cr, X, options(3));

        % Selection
        if mod(g,10) == 0
            r = r+r_inc;
        end
        X_new = Selection(U, X, r, Prob_k);

        % Recoad
        Record(g, X, r, Prob_k);

        X=X_new;
    end
    if Prob_k>=10
        path = ['./save/','DE/RC',int2str(Prob_k)];
    else
        path = ['./save/','DE/RC0',int2str(Prob_k)];
    end
    if exist(path,'dir')~=7
        mkdir(path);
    end
    fprintf("Saving...the %d\n", i);
    xlswrite([path,'/',int2str(i),'.xlsx'], history);
end
