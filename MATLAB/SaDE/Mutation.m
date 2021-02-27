%Mutation
function V = Mutation(X, F, strategy)
    global Xmin Xmax
    global gbest lbest
    [NP, D] = size(X);
    if strategy==1
        % DE/rand/1
        mutant_rand = ceil(rand(NP, 3)*NP);
        V = X(mutant_rand(:,1),:) + F(1)*(X(mutant_rand(:,2),:) -  X(mutant_rand(:,3),:));
    elseif strategy==2
        % DE/rand/2
        mutant_rand = ceil(rand(NP, 5)*NP);
        V = X(mutant_rand(:,1),:) + F(1)*(X(mutant_rand(:,2),:)-X(mutant_rand(:,3),:)) + F(2)*(X(mutant_rand(:,4),:)-X(mutant_rand(:,5),:));
    elseif strategy==3
        % DE/current-to-rand/1
        mutant_rand = ceil(rand(NP, 4)*NP);
        V = X + F(1)*(X(mutant_rand(:,2),:)-X(mutant_rand(:,3),:)) + F(1)*(X(mutant_rand(:,4),:)-X);
    elseif strategy==4
        % DE/rand-to-best/2
        mutant_rand = ceil(rand(NP, 3)*NP);
        V = X(mutant_rand(:,1),:) + F(1)*(X(mutant_rand(:,2),:)-X(mutant_rand(:,3),:)) + F(2)*(repmat(lbest, NP, 1)-X(mutant_rand(:,1),:));
    end
    for col=1:D
        V(Xmin(col)>V(:,col), col) = Xmin(col);
        V(Xmax(col)<V(:,col), col) = Xmax(col);
    end
end