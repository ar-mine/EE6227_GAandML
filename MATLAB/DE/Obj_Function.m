% Obj_Fucntion
function f_penalty = Obj_Function(X, r, Prob_k)
    [NP, ~] = size(X);
    delta = 1e-6;
    [f, g, h] = cec20_func(X, Prob_k);
    h = abs(h)-delta;  
    
%     g_ = max(g,0);
%     h_ = max(h,0);
%     g_sum = sum(g_,1)+1e-8;
%     h_sum = sum(h_,1)+1e-8;
%     g_norm = g_./g_sum*NP;
%     h_norm = h_./h_sum*NP;
    g_norm = max(g,0)            ./ (sum(max(g,0), 1)            +1e-8)*100;
    h_norm = max(abs(h)-delta,0) ./ (sum(max(abs(h)-delta,0), 1) +1e-8)*100;
    
    
    f_penalty = f + [g_norm.^2 h_norm.^2]*r;
end