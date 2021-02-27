% Selection
function X_new = Selection(U, X, r, Prob_k)
    U_cons = Obj_Function(U, r, Prob_k);
    X_cons = Obj_Function(X, r, Prob_k);
    U_X_index = U_cons<X_cons;
    X_new = zeros(size(X));
    X_new(U_X_index,:) = U(U_X_index,:);
    X_new(~U_X_index,:) = X(~U_X_index,:);
end