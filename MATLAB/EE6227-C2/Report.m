function Report(gen, popn, xpopn, fitness, meanfhistory, maxfhistory, xopthistory)
    disp(' '); disp(' '); disp(' ');
    disp((sprintf('Generation %0.5f', gen)));
    disp(' ');
    disp(('string x fitness'));
    popnstring =char(48 + popn); % to compress the matrix
    for i=1:size(popn,1) % output current popn stats.
        disp([popnstring(i,:) sprintf('%16.8g %16.8g', xpopn(i), fitness(i))]);
    end
    disp(' ');
    disp('Fitness Histroy Statistics');
    disp('Generation Mean Fitness Max Fitness Optimal x');
    history = [[0:gen].' meanfhistory maxfhistory xopthistory].';
    disp([sprintf('%5.0f %16.6g %16.6g %e\n',history)]);
end