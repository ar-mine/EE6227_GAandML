% DE algorithm
clc;clear;
global Xmin Xmax;
global history;
global c Cr mu_Cr F mu_F A_set p

%% Parameters needed to be changed
% Choose the problem optimized
Prob_index = 10;
% Debug or Release(0, 1), release will minimize visualize output
release = 0;
% Coefficient of iterations
C_i = 2;
Total_i = 1;
% Parammeters of DE
 c = 0.05;
 p = 0.1;

%% Parameters init
[Prob_k, D_size, NP, Xmin, Xmax, rc, r_inc, f_solu] = Parameters(Prob_index);
Gen = ceil(5e4/NP)*C_i;

%% Iteration
% 30 iterations
for i=1:Total_i
    r = rc;
    A_set = [];
    mu_Cr = 0.5;
    mu_F = 0.5;
   
    % Initialization
    X = Initialization(D_size, NP, Xmax, Xmin);
    
    % Title
    if(i==1 || release==0)
        fprintf('Gen        Mean         Median         SD         Fit         Best         Worst         MV\n');
    end
    
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
    if release
        fprintf(' %d     %7f     %7f     %7.4f   %.4e     %7f     %7f     %7e\n', i, history(end,2), history(end,3), history(end,4), history(end,5), history(end,6), history(end,7), history(end,8));   
    else
        fprintf("Saving...the %d\n", i);
    end
    xlswrite([path,'/',int2str(i),'.xlsx'], history);
end
fprintf(' %d     %2.2e     %2.2e     %2.2e   %2.2e     %2.2e     %2.2e     %2.2e\n', i, history(end,2)-f_solu, history(end,3)-f_solu, history(end,4), history(end,5), history(end,6)-f_solu, history(end,7)-f_solu, history(end,8));