% Evaluation
function f_penalty = Evaluation(gen, X, r, f, g, h)
    global history;
    delta = 1e-6;
    
    g_norm = max(g,0)            ./ (sum(max(g,0), 1)            +1e-8)*100;
    h_norm = max(abs(h)-delta,0) ./ (sum(max(abs(h)-delta,0), 1) +1e-8)*100;
       
    f_penalty = f + [g_norm.^2 h_norm.^2]*r;
%     [P_fitness, P_idx] = min(X_fitness);
%     P = X(P_idx,:);
    
    MV = mean(mean([max(g,0) max(abs(h)-delta,0)], 'all'));
    mean_ = mean(f);
    median_ = median(f);
    SD = std(f);
    worst = max(f);
    best = min(f);
    fprintf(' %d     %7f     %7f     %7.4f   %.4e     %7f     %7f     %7e\n', gen, mean_, median_, SD, mean(f_penalty), best, worst, MV);
    history = [history; gen, mean_, median_, SD, mean(f_penalty), best, worst, MV];
end