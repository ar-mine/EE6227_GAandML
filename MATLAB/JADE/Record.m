% Record
function [mean_, median_, SD] = Record(gen, X, r, Prob_k)
    global history pbest_set 
    global c mu_Cr Cr_set mu_F F_set
    
    [fitness, Opt_fit, MV] = Obj_Function(X, r, Prob_k);
    mean_ = mean(fitness);
    median_ = median(fitness);
    SD = std(fitness);
    worst = max(fitness);
    [best, ibest] = min(fitness);
    fprintf(' %d\t\t%7f\t%7f\t%7f\t%7e\t%7f\t%7f\t%7e\n', gen, mean_, median_, SD, mean(Opt_fit), best, worst, MV);
    history = [history;gen, mean_, median_, SD, mean(Opt_fit), best, worst, MV];
    val_sorted = sortrows([Opt_fit X], 1);
    pbest_set = val_sorted(ceil(size(X)*0.1), 2:size(X,2)+1);
    if gen ~= 0 && ~isempty(Cr_set)
        mu_Cr = (1-c)*mu_Cr + c*mean(Cr_set);
        mu_F  = (1-c)*mu_F  + c*sum(F_set.^2)/sum(F_set);
    end
end