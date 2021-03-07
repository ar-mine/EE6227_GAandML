% clc;clear;
% load record.mat 
% load record2.mat 
% load record3.mat 
% n = 1:1:30;
% plot(n,record,'or',n,record2,'*y',n,record3,'+b');
% legend('F=0.5,Cr=0.7','F=0.2,Cr=0.3','F=0.8,Cr=0.7')
% fprintf(' %2.2e     %2.2e     %2.2e     %2.2e  %2.2e     %2.2e     %2.2e    %2.2e'...
%     ,Untitled(1,1), Untitled(1,2),Untitled(1,3),Untitled(1,4),Untitled(1,5),Untitled(1,6),Untitled(1,7),Untitled(1,8));
%Untitled

f_solu1 = 1.8931162966E+02;
f_solu2 = 7.0490369540E+03;
f_solu3 = -4.5291197395E+03;
f_solu4 = 9.9238463653E+01;
f_solu5 = 2.9248305537E+00;
f_solu6 = 2.9944244658E+03;
f_solu7 = 3.2213000814E-02;
f_solu8 = 1.6069868725E+01;
f_solu9 = 5.2445076066E+02;
f_solu10 = 1.4614135715E+04;
probset = ['01';'02' ;'03'; '11'; '12'; '15'; '16'; '23'; '27'; '28'];
DE_set = [];SADE_set = [];JADE_set = [];SHADE_set = [];

for i = 1:10
    Prob_idx = probset(i,:);
    DE    = log(eval(['DE_RC', Prob_idx]));
    SADE  = log(eval(['SA_RC', Prob_idx]));
    JADE  = log(eval(['JA_RC', Prob_idx]));
    SHADE = log(eval(['SH_RC', Prob_idx]));
    Opt   = log(eval(['f_solu', int2str(i)]));
    DE_set = [DE_set; DE(end)-Opt];
    SADE_set = [SADE_set; SADE(end)-Opt];
    JADE_set = [JADE_set; JADE(end)-Opt];
    SHADE_set = [SHADE_set; SHADE(end)-Opt];
end
% plot(DE,'LineWidth',1.5);
% hold on
% plot(SADE,'LineWidth',1.5);
% plot(JADE,'LineWidth',1.5);
% plot(SHADE,'LineWidth',1.5);
% plot(Opt,'LineWidth',1.5);
% legend("DE", "SaDE", "JADE", "SHADE", "Opt");