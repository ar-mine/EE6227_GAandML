function ran = Constraints(X, Xmin, Xmax)
    ran = [];
    for i=1:length(Xmin)
        ran = [ran Xmin(i)-X(:,i)];
    end
    for i=1:length(Xmax)
        ran = [ran X(:,i)-Xmax(i)];
    end
end