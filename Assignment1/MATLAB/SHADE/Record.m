% Record
function [mean_, median_, SD] = Record(gen, X, r, Prob_k)
    global history pbest_set p H
    global Cr_set F_set M_Cr M_F
    
    [fitness, Opt_fit, MV] = Obj_Function(X, r, Prob_k);
    mean_ = mean(fitness);
    median_ = median(fitness);
    SD = std(fitness);
    worst = max(fitness);
    [best, ibest] = min(fitness);
    fprintf(' %d\t\t%7f\t%7f\t%7f\t%7e\t%7f\t%7f\t%7e\n', gen, mean_, median_, SD, mean(Opt_fit), best, worst, MV);
    history = [history;gen, mean_, median_, SD, mean(Opt_fit), best, worst, MV];
    val_sorted = sortrows([Opt_fit X], 1);
    pbest_set = val_sorted(ceil(size(X)*p), 2:size(X,2)+1);
    if gen ~= 0 && ~isempty(Cr_set)
        M_Cr(mod(gen,H)+1) = mean(Cr_set);
        M_F(mod(gen,H)+1)  = sum(F_set.^2)/sum(F_set);
    end
end