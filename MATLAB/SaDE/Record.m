% Record
function [mean_, median_, SD] = Record(gen, X, r, Prob_k)
    global history gbest lbest Crmean Cr
    persistent gbest_val Crrec lastval
    [fitness, Opt_fit, MV] = Obj_Function(X, r, Prob_k);
    mean_ = mean(fitness);
    median_ = median(fitness);
    SD = std(fitness);
    worst = max(fitness);
    [best, ibest] = min(fitness);
    fprintf(' %d\t\t%7f\t%7f\t%7f\t%7e\t%7f\t%7f\t%7e\n', gen, mean_, median_, SD, mean(Opt_fit), best, worst, MV);
    history = [history;gen, mean_, median_, SD, mean(Opt_fit), best, worst, MV];
    lbest = X(ibest,:);
    if gen==0
        gbest_val = best;
        gbest = X(ibest,:);
    else
        if best<gbest_val
            gbest_val = best;
            gbest = X(ibest,:);
        end  
    end
    if gen==0
        Crmean = 0.5;
        Crrec = [];   
    elseif mod(gen,10) == 0
        Crmean = mean(Crrec);
    else
        if median_ <= lastval
            Crrec = [Crrec Cr]; 
        end
    end
    %%%%% TODO
    lastval = mean(Opt_fit);
end