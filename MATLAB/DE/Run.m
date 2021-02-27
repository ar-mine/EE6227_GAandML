% DE algorithm
clc;clear;
global Xmin Xmax;
global history;

%% Parameters needed to be changed
% Choose the problem optimized
Prob_index = 1;
% Coefficient of iterations
C_i = 1;
Total_i = 1;
% Parammeters of PSO
F = 0.6;
Cr = 0.8;

%% Parameters init
[Prob_k, D_size, NP, Xmin, Xmax, r, r_inc] = Parameters(Prob_index);
Gen = ceil(5e4/NP)*C_i;

%% Iteration
% 30 iterations
for i=1:Total_i
    % Initialization
    X = Initialization(D_size, NP, Xmax, Xmin);
    
    fprintf('Gen        Mean         Median         SD         Fit         Best         Worst         MV\n');
    
    [f, g, h] = cec20_func(X, Prob_k);
    f_penalty = Evaluation(0, X, r, f, g, h);

    for gen=1:Gen
        %Mutation
        V = Mutation(X, F);

        % Recombination(Binominal/uniform Crossover)
        U = Recombination(V, D_size, NP, Cr, X);
        
        % Selection
        X = Selection(U, X, r, Prob_k);
        
        % Evaluation
        [f, g, h] = cec20_func(X, Prob_k);
        Evaluation(gen, X, r, f, g, h);
        
        if mod(gen,10) == 0
            r = r+r_inc;
        end
    end
    if Prob_k>=10
        path = ['./SAVE/','RC',int2str(Prob_k)];
    else
        path = ['./SAVE/','RC0',int2str(Prob_k)];
    end
    if exist(path,'dir')~=7
        mkdir(path);
    end
    fprintf("Saving...the %d\n", i);
    xlswrite([path,'/',int2str(i),'.xlsx'], history);
end
