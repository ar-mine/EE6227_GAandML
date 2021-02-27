clc;clear;

% Choose the problem optimized
Prob_index = 9;

global Xmin Xmax
global history A_set
global c Cr mu_Cr F mu_F
[Prob_k, D_size, NP, Xmin, Xmax, r, r_inc] = Parameters(Prob_index);
Gen = ceil(5e4/NP)*2; 
% 0.05->0.2
c = 0.05;

% 30 iterations
for i=1:30
    A_set = [];
    mu_Cr = 0.5;
    mu_F = 0.5;
    % Initialization
    X = Initialization(D_size, NP, Xmax, Xmin);
    fprintf('Gen\t\tMean\t\tMedian\t\tSD\t\t\tFit\t\t\t\tBest\t\tWorst\t\tMV\n')
    Record(0, X, r, Prob_k);
    
    for g=1:Gen
        Cr = normrnd(mu_Cr ,0.1, NP, 1);
        Cr(Cr<0) = 0;
        Cr(Cr>1) = 1;
        
        F_rand = rand(NP, 1);
        F = mu_F + 0.1*tan(pi*(F_rand-0.5));
        F(F>1) = 1;
        while sum(F<0) ~= 0
            F_rand = rand(sum(F<0), 1);
            F(F<0) = mu_F + 0.1*tan(pi*(F_rand-0.5));
            F(F>1) = 1;
        end
        %Mutation
        V = Mutation(X, F);

        % Recombination(Binominal/uniform Crossover)
        U = Recombination(V, D_size, NP, Cr, X);

        % Selection
        X = Selection(U, X, r, Prob_k);

        % Record
        Record(g, X, r, Prob_k);
        if mod(g,10) == 0
            r = r+r_inc;
        end
    end
    
    % Save output information
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
