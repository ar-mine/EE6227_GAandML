% SaDE algorithm
clc;clear;
global Xmin Xmax;
global history;
global Crmean Cr

%% Parameters needed to be changed
% Choose the problem optimized
Prob_index = 8;
% Debug or Release(0, 1), release will minimize visualize output
release = 0;
% Coefficient of iterations
C_i = 2;
Total_i = 1;

%% Parameters init
[Prob_k, D_size, NP, Xmin, Xmax, rc, r_inc, f_solu] = Parameters(Prob_index);
Gen = ceil(5e4/NP)*C_i;
% Parammeters of DE
LP = ceil(Gen*0.05);
diff = 0.05;

%% Iteration
% 30 iterations
for i=1:Total_i
    history = [];
    Crmean = 0.5;
    r = rc;
    success_rate = zeros(1, 4);
    count = zeros(1, 4);
    % Initialization
    X = Initialization(D_size, NP, Xmax, Xmin);
    
    % Title
    if(i==1 || release==0)
        fprintf('Gen        Mean         Median         SD         Fit         Best         Worst         MV\n');
    end
    Record(0, X, r, Prob_k);
    pdrand = [0 0.25 0.5 0.75];
    for g=1:LP
        F = normrnd(0.5 ,diff, NP, 2);
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
        F = normrnd(0.5 ,diff, NP, 2);
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
    if release
        fprintf(' %d     %7f     %7f     %7.4f   %.4e     %7f     %7f     %7e\n', i, history(end,2), history(end,3), history(end,4), history(end,5), history(end,6), history(end,7), history(end,8));   
    else
        fprintf("Saving...the %d\n", i);
    end
    xlswrite([path,'/',int2str(i),'.xlsx'], history);
end
fprintf(' %d     %2.2e     %2.2e     %2.2e   %2.2e     %2.2e     %2.2e     %2.2e\n', i, history(end,2)-f_solu, history(end,3)-f_solu, history(end,4), history(end,5), history(end,6)-f_solu, history(end,7)-f_solu, history(end,8));