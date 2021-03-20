% Selection
function X_new = Selection(U, X, r, Prob_k)
    global A_set Cr_set Cr F_set F
    NP = size(X, 1);
    [~, U_cons] = Obj_Function(U, r, Prob_k);
    [~, X_cons] = Obj_Function(X, r, Prob_k);
    U_X_index = U_cons<X_cons;
    X_new = zeros(size(X));
    X_new(U_X_index,:) = U(U_X_index,:);
    X_new(~U_X_index,:) = X(~U_X_index,:);
    A_set = [A_set; X(U_X_index,:)];
    while size(A_set, 1) > NP
        delete_idx = ceil(rand(size(A_set, 1)-NP, 1)*size(A_set, 1));
        A_set(delete_idx, :)=[];
    end 
    Cr_set = Cr(U_X_index, :);
    F_set  = F(U_X_index, :);
end