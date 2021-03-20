% Obj_Fucntion
function [f, obj_fun, MV] = Obj_Function(X, r, Prob_k)
    [NP, ~] = size(X);
    delta = 1e-6;
    [f, g, h] = cec20_func(X, Prob_k); 
    
    g_ = max(g,0);
    h_ = max(abs(h)-delta,0);
    g_sum = sum(g_,1)+1e-8;
    h_sum = sum(h_,1)+1e-8;
    g_norm = g_./g_sum*NP;
    h_norm = h_./h_sum*NP;
    
    
    obj_fun = f + [g_norm.^2 h_norm.^2]*r;
    MV = mean(mean([max(g,0) max(h,0)], 'all'));
end