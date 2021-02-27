% PSO algorithm
clc;clear;
global Xmin Xmax Vmax;
global history;

%% Parameters needed to be changed
% Choose the problem optimized
Prob_index = 1;
% Coefficient of iterations
C_i = 1;
Total_i = 1;
% Parammeters of PSO
Fai_1 = 0.5;
Fai_2 = 0.5;

%% Parameters init
[Prob_k, D_size, NP, Xmin, Xmax, r, r_inc, Vmax] = Parameters(Prob_index);
Gen = ceil(5e4/NP)*C_i;


%% Iteration
% 30 iterations
for i=1:Total_i
    % Initialization
    [X, V] = Initialization(D_size, NP);
    [f, g, h] = cec20_func(X, Prob_k);
      
    fprintf('Gen        Mean         Median         SD         Fit         Best         Worst         MV\n');
    
    [P_fitness, P] = Evaluation(0, X, r, f, g, h);
    
        for gen=1:Gen          
            V = V + Fai_1*rand(NP, D_size).*(repmat(P, NP, 1)-X);
            for col=1:D_size
                V(Vmax(col)<V(:,col), col) = Vmax(col);
                V((-Vmax(col))>V(:,col), col) = -Vmax(col);
            end
            X = X + V;
            for col=1:D_size
                X(Xmin(col)>X(:,col), col) = Xmin(col);
                X(Xmax(col)<X(:,col), col) = Xmax(col);
            end
            
            [f, g, h] = cec20_func(X, Prob_k);

            [P_fitness, P] = Evaluation(gen, X, r, f, g, h);
            
            % Update r weighted value
            if mod(gen,5) == 0
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
