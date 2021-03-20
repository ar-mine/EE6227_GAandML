%Mutation
function V = Mutation(X, F)
    global Xmin Xmax
    global pbest_set A_set
    [NP, D] = size(X);
    
    pbest = pbest_set(ceil(rand()*size(pbest_set, 1)), :); 
    % DE/current-to-pbest/1
    mutant_rand1 = ceil(rand(NP, 1)*NP);
    PUA = [X;A_set];
    mutant_rand2 = ceil(rand(NP, 1)*size(PUA, 1));
    V = X + F(1).*(X(mutant_rand1(:,1),:)-PUA(mutant_rand2(:,1),:)) + F(1).*(repmat(pbest, NP, 1)-X);
    
    for col=1:D
        V(Xmin(col)>V(:,col), col) = Xmin(col);
        V(Xmax(col)<V(:,col), col) = Xmax(col);
    end
end