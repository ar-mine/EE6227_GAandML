% DE algorithm
clc;clear;
global Xmin Xmax;
global history;

%% Parameters needed to be changed
% Choose the problem optimized
Prob_index = 1;
% Debug or Release(0, 1), release will minimize visualize output
release = 1;
% Coefficient of iterations
C_i = 2;
Total_i = 30;
% Parammeters of DE(Grid search range)
f = (0:0.1:1.5);
cr = (0:0.1:1.0);

%% Parameters init
[Prob_k, D_size, NP, Xmin, Xmax, rc, r_inc, f_solu] = Parameters(Prob_index);
Gen = ceil(5e4/NP)*C_i;
result = [];

%% Iteration
for F=f
for Cr=cr
    record = [];
% 30 iterations
for i=1:Total_i
    history = [];
    r = rc;
    % Initialization
    X = Initialization(D_size, NP, Xmax, Xmin);
    
    % Title
%     if(i==1 || release==0)
%         fprintf('Gen        Mean         Median         SD         Fit         Best         Worst         MV\n');
%     end
    
    [f, g, h] = cec20_func(X, Prob_k);
    f_penalty = Evaluation(0, X, r, f, g, h, release);

    for gen=1:Gen
        %Mutation
        V = Mutation(X, F);

        % Recombination(Binominal/uniform Crossover)
        U = Recombination(V, D_size, NP, Cr, X);
        
        % Selection
        X = Selection(U, X, r, Prob_k);
        
        % Evaluation
        [f, g, h] = cec20_func(X, Prob_k);
        Evaluation(gen, X, r, f, g, h, release);
        
        if mod(gen,10) == 0
            r = r+r_inc;
        end
    end

    % mean median SD MV
    record = [record; history(end,2), history(end,3), history(end,4), history(end,8)];
%     if release
%         fprintf(' %d     %7f     %7f     %7.4f   %.4e     %7f     %7f     %7e\n', i, history(end,2), history(end,3), history(end,4), history(end,5), history(end,6), history(end,7), history(end,8));
%     else
%         fprintf("Saving...the %d\n", i);
%     end

end
% mean median error, median error sd, mean sd, mean mv
median_err = mean(record(:,2)-f_solu);
median_sd = std(record(:,2));
sd_mean = mean(record(:,3));
mv_mean = mean(record(:,4));
fprintf("Current F:%f,Cr:%f,err_mean:%f,err_sd:%f,sd_mean:%f,mv_mean:%f\n", F, Cr, median_err, median_sd, sd_mean, mv_mean);
result = [result; F Cr median_err median_sd sd_mean mv_mean];
end
end

% save record
if Prob_k>=10
    path = ['./SAVE/','RC',int2str(Prob_k)];
else
    path = ['./SAVE/','RC0',int2str(Prob_k)];
end
if exist(path,'dir')~=7
    mkdir(path);
end
xlswrite([path,'/','r=',int2str(r_inc),'.xlsx'], result);