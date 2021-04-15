function [outcome, centers] = k_means(X, cluster_num)
    tolerance = 0.1;
    feature_num = size(X, 2);
    Xmax = max(X);
    Xmin = min(X);
    centers = rand([cluster_num feature_num]).*(Xmax-Xmin) + Xmin;
    distances = zeros(cluster_num, size(X, 1));
    while true
        center_old = centers;
        for c=1:cluster_num
            center = centers(c, :);
            distance = sum((X-center).^2, 2);
            distances(c, :) = distance;
        end
        [~, outcome] = min(distances);
        for c=1:cluster_num
            idx = outcome == c;
            points = X(idx, :);
            centers(c, :) = mean(points);
        end
        if sum((abs(centers-center_old)<tolerance)==0)
            break
        end
    end    
end