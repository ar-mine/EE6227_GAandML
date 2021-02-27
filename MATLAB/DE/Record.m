% Record
function [mean_, median_, SD] = Record(gen, X, r, Prob_k)
    global history;
    [fitness, Opt_fit, MV] = Obj_Function(X, r, Prob_k);
    mean_ = mean(fitness);
    median_ = median(fitness);
    SD = std(fitness);
    worst = max(fitness);
    best = min(fitness);
    fprintf(' %d\t\t%7f\t%7f\t%7f\t%7e\t%7f\t%7f\t%7e\n', gen, mean_, median_, SD, mean(Opt_fit), best, worst, MV);
    history = [history; gen, mean_, median_, SD, mean(Opt_fit), best, worst, MV];
end