clc;clear;

% Choose the problem optimized
Prob_index = 1;

global Xmin Xmax
global history Crmean Cr
[Prob_k, D_size, NP, Xmin, Xmax, r, r_inc] = Parameters(Prob_index);
Gen = ceil(5e4/NP)*1;
LP = ceil(Gen*0.25);

% 30 iterations
for i=1:1
    success_rate = zeros(1, 4);
    count = zeros(1, 4);
    % Initialization
    X = Initialization(D_size, NP, Xmax, Xmin);
    fprintf('Gen\t\tMean\t\tMedian\t\tSD\t\t\tFit\t\t\t\tBest\t\tWorst\t\tMV\n')
    Record(0, X, r, Prob_k);
    pdrand = [0 0.25 0.5 0.75];
    for g=1:LP
        F = normrnd(0.5 ,0.3, 1, 2);
        Cr = normrnd(Crmean ,0.1, 1);
        
        rand_temp = rand();
        strategy = sum(rand_temp>pdrand);

        %Mutation
        V = Mutation(X, F, strategy);

        % Recombination(Binominal/uniform Crossover)
        U = Recombination(V, D_size, NP, Cr, X);

        % Selection
        [X, success] = Selection(U, X, r, Prob_k);
        success_rate(strategy) = success_rate(strategy)+success;
        count(strategy) = count(strategy)+1;

        % Record
        Record(g, X, r, Prob_k);
        if mod(g,10) == 0
            r = r+r_inc;
        end
    end
    success_rate = success_rate./count/(NP*D_size);
    success_rate = success_rate/sum(success_rate);
    pdrand = cumsum(success_rate)-success_rate(1);
    for g=LP+1:Gen
        F = normrnd(0.5 ,0.3, 1, 2);
        Cr = normrnd(Crmean ,0.1, 1);
        
        rand_temp = rand();
        strategy = sum(rand_temp>pdrand);

        %Mutation
        V = Mutation(X, F, strategy);

        % Recombination(Binominal/uniform Crossover)
        U = Recombination(V, D_size, NP, Cr, X);

        % Selection

        
        [X, success] = Selection(U, X, r, Prob_k);

        % Record
        Record(g, X, r, Prob_k);
        if mod(g,10) == 0
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
    fprintf("Saving...the %d", i);
    xlswrite([path,'/',int2str(i),'.xlsx'], history);
end
