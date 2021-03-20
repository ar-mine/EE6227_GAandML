function [f,g,h] = cec20_func(x,prob_k)
% cec20_func Constrained Optimization Test Suite 
% Abhishek Kumar (email: abhishek.kumar.eee13@iitbhu.ac.in, Indian Institute of Technology (BHU), Varanasi) 

% x -----> ps X D where 'ps': number of population and 'D': Dimension of
% the problem.
% f -----> Objective Function Value.
% g -----> Inequality Consstraints Value; ps X ng where 'ng': number of
% inequality constraints.
% h -----> Equality Constraints Value; ps X nh where 'nh': number of
% equality constraints.
% prob_k -> Index of problem.


[ps,D]=size(x);
global initial_flag
persistent G B P Q L

%% Industrial Chemical Processes		
if(prob_k == 1)
    %% Heat Exchanger Network Design (case 1)
    f = 35.*x(:,1).^0.6 + 35.*x(:,2).^0.6;
    g = zeros(ps,1);
    h(:,1) = 200.*x(:,1).*x(:,4)-x(:,3);
    h(:,2) = 200.*x(:,2).*x(:,6)-x(:,5);
    h(:,3) = x(:,3) - 10000.*(x(:,7)-100);
    h(:,4) = x(:,5) - 10000.*(300-x(:,7));
    h(:,5) = x(:,3) - 10000.*(600-x(:,8));
    h(:,6) = x(:,5) - 10000.*(900-x(:,9));
    h(:,7) = x(:,4).*log(abs(x(:,8)-100)+1e-8)-x(:,4).*log((600-x(:,7))+1e-8)-x(:,8)+x(:,7)+500;
    h(:,8) = x(:,6).*log(abs(x(:,9)-x(:,7))+1e-8)-x(:,6).*log(600)-x(:,9)+x(:,7)+600;
end


if(prob_k == 2)
    %% Heat Exchanger Network Design (case 2)
    f = (x(:,1)./(120*x(:,4))).^0.6+(x(:,2)./(80*x(:,5))).^0.6+(x(:,3)./(40*x(:,6))).^0.6;
    g = zeros(ps,1);
    h(:,1) = x(:,1)-1e4.*(x(:,7)-100);
    h(:,2) = x(:,2)-1e4.*(x(:,8)-x(:,7));
    h(:,3) = x(:,3)-1e4.*(500-x(:,8));
    h(:,4) = x(:,1)-1e4.*(300-x(:,9));
    h(:,5) = x(:,2)-1e4.*(400-x(:,10));
    h(:,6) = x(:,3)-1e4.*(600-x(:,11));
    h(:,7) = x(:,4).*log(abs(x(:,9)-100)+1e-8)-x(:,4).*log(300-x(:,7)+1e-8)-x(:,9)-x(:,7)+400;
    h(:,8) = x(:,5).*log(abs(x(:,10)-x(:,7))+1e-8)-x(:,5).*log(abs(400-x(:,8))+1e-8)-x(:,10)+x(:,7)-x(:,8)+400;
    h(:,9) = x(:,6).*log(abs(x(:,11)-x(:,8))+1e-8)-x(:,6).*log(100)-x(:,11)+x(:,8)+100;
end

if (prob_k == 3)
    %% Optimal Operation of Alkylation Unit
      f = -1.715.*x(:,1)-0.035.*x(:,1).*x(:,6)-4.0565.*x(:,3)-10.0.*x(:,2)+0.063.*x(:,3).*x(:,5);
      h = zeros(ps,1);
      g(:,1) = 0.0059553571.*x(:,6).^2.*x(:,1)+0.88392857.*x(:,3)-0.1175625.*x(:,6).*x(:,1)-x(:,1);
      g(:,2) = 1.1088.*x(:,1)+0.1303533.*x(:,1).*x(:,6)-0.0066033.*x(:,1).*x(:,6).^2-x(:,3);
      g(:,3) = 6.66173269.*x(:,6).^2+172.39878.*x(:,5)-56.596669.*x(:,4)-191.20592.*x(:,6)-10000;
      g(:,4) = 1.08702.*x(:,6)+0.32175.*x(:,4)-0.03762.*x(:,6).^2-x(:,5)+56.85075;
      g(:,5) = 0.006198.*x(:,7).*x(:,4).*x(:,3)+2462.3121.*x(:,2)-25.125634.*x(:,2).*x(:,4)-x(:,3).*x(:,4);
      g(:,6) = 161.18996.*x(:,3).*x(:,4)+5000.0.*x(:,2).*x(:,4)-489510.0.*x(:,2)-x(:,3).*x(:,4).*x(:,7);
      g(:,7) = 0.33.*x(:,7)-x(:,5)+44.333333;
      g(:,8) = 0.022556.*x(:,5)-0.007595.*x(:,7)-1.0;
      g(:,9) = 0.00061.*x(:,3)-0.0005.*x(:,1)-1.0;
      g(:,10)= 0.819672.*x(:,1)-x(:,3)+0.819672;
      g(:,11)= 24500.0.*x(:,2)-250.0.*x(:,2).*x(:,4)-x(:,3).*x(:,4);
      g(:,12)= 1020.4082.*x(:,4).*x(:,2)+1.2244898.*x(:,3).*x(:,4)-100000.*x(:,2);
      g(:,13)= 6.25.*x(:,1).*x(:,6)+6.25.*x(:,1)-7.625.*x(:,3)-100000;
      g(:,14)= 1.22.*x(:,3)-x(:,6).*x(:,1)-x(:,1)+1.0;
end

if (prob_k == 4)
    %% Reactor Network Design (RND)
    k1 = 0.09755988;
    k2 = 0.99.*k1;
    k3 = 0.0391908;
    k4 = 0.9.*k3;
    f = -x(:,4);
    h(:,1) = x(:,1)+k1.*x(:,2).*x(:,5)-1;
    h(:,2) = x(:,2)-x(:,1)+k2.*x(:,2).*x(:,6);
    h(:,3) = x(:,3)+x(:,1)+k3.*x(:,3).*x(:,5)-1;
    h(:,4) = x(:,4)-x(:,3)+x(:,2)-x(:,1)+k4.*x(:,4).*x(:,6);
    g(:,1) = x(:,5).^0.5+x(:,6).^0.5-4;
end

if(prob_k == 5)
    %% Haverly's Pooling Problem
    f = (9.*x(:,1)+15.*x(:,2)-6.*x(:,3)-16.*x(:,4)-10.*(x(:,5)+x(:,6)));
    g(:,1) = x(:,9).*x(:,7)+2.*x(:,5)-2.5.*x(:,1);
    g(:,2) = x(:,9).*x(:,8)+2.*x(:,6)-1.5.*x(:,2);
    h(:,1) = x(:,7)+x(:,8)-x(:,3)-x(:,4);
    h(:,2) = x(:,1)-x(:,7)-x(:,5);
    h(:,3) = x(:,2)-x(:,8)-x(:,6);
    h(:,4) = x(:,9).*x(:,7)+x(:,9).*x(:,8)-3.*x(:,3)-x(:,4);
end

if(prob_k == 6)
    %% Blending-Pooling-Separation problem
    f = 0.9979+0.00432.*x(:,5)+0.01517.*x(:,13);
    g = zeros(ps,1);
    h(:,1) = x(:,1)+x(:,2)+x(:,3)+x(:,4)-300;
    h(:,2) = x(:,6)-x(:,7)-x(:,8);
    h(:,3) = x(:,9)-x(:,10)-x(:,11)-x(:,12);
    h(:,4) = x(:,14)-x(:,15)-x(:,16)-x(:,17);
    h(:,5) = x(:,18)-x(:,19)-x(:,20);
    h(:,6) = x(:,5).*x(:,21)-x(:,6).*x(:,22)-x(:,9).*x(:,23);
    h(:,7) = x(:,5).*x(:,24)-x(:,6).*x(:,25)-x(:,9).*x(:,26);
    h(:,8) = x(:,5).*x(:,27)-x(:,6).*x(:,28)-x(:,9).*x(:,29);
    h(:,9) = x(:,13).*x(:,30)-x(:,14).*x(:,31)-x(:,18).*x(:,32);
    h(:,10) = x(:,13).*x(:,33)-x(:,14).*x(:,34)-x(:,18).*x(:,35);
    h(:,11) = x(:,13).*x(:,36)-x(:,14).*x(:,37)-x(:,18).*x(:,38);
    h(:,12) = 1/3.*x(:,1)+x(:,15).*x(:,31)-x(:,5).*x(:,21);
    h(:,13) = 1/3.*x(:,1)+x(:,15).*x(:,34)-x(:,5).*x(:,24);
    h(:,14) = 1/3.*x(:,1)+x(:,15).*x(:,37)-x(:,5).*x(:,27);
    h(:,15) = 1/3.*x(:,2)+x(:,10).*x(:,23)-x(:,13).*x(:,30);
    h(:,16) = 1/3.*x(:,2)+x(:,10).*x(:,26)-x(:,13).*x(:,33);
    h(:,17) = 1/3.*x(:,2)+x(:,10).*x(:,29)-x(:,13).*x(:,36);
    h(:,18) = 1/3.*x(:,3)+x(:,7).*x(:,22)+x(:,11).*x(:,23)+x(:,16).*x(:,31)+x(:,19).*x(:,32)-30;
    h(:,19) = 1/3.*x(:,3)+x(:,7).*x(:,25)+x(:,11).*x(:,26)+x(:,16).*x(:,34)+x(:,19).*x(:,35)-50;
    h(:,20) = 1/3.*x(:,3)+x(:,7).*x(:,28)+x(:,11).*x(:,29)+x(:,16).*x(:,37)+x(:,19).*x(:,38)-30;
    h(:,21) = x(:,21)+x(:,24)+x(:,27)-1;
    h(:,22) = x(:,22)+x(:,25)+x(:,28)-1;
    h(:,23) = x(:,23)+x(:,26)+x(:,29)-1;
    h(:,24) = x(:,30)+x(:,33)+x(:,36)-1;
    h(:,25) = x(:,31)+x(:,34)+x(:,37)-1;
    h(:,26) = x(:,32)+x(:,35)+x(:,38)-1;
    h(:,27) = x(:,25);
    h(:,28) = x(:,28);
    h(:,29) = x(:,23);
    h(:,30) = x(:,37);
    h(:,31) = x(:,32);
    h(:,32) = x(:,35);
end

if(prob_k == 7)
    %% Propane, Isobutane, n-Butane Nonsharp Separation
    c = [ 0.23947, 0.75835; -0.0139904, -0.0661588; 0.0093514, 0.0338147;.....
        0.0077308, 0.0373349; -0.0005719, 0.0016371;0.0042656, 0.0288996];
    f = c(1,1)+(c(2,1)+c(3,1).*x(:,24)+c(4,1).*x(:,28)+c(5,1).*x(:,33)+c(6,1).*x(:,34)).*x(:,5)....
        +c(1,2)+(c(2,2)+c(3,2).*x(:,26)+c(4,2).*x(:,31)+c(5,2).*x(:,38)+c(6,2).*x(:,39)).*x(:,13);
    g = zeros(ps,1);
    h(:,1) = x(:,1)+x(:,2)+x(:,3)+x(:,4)-300;
    h(:,2) = x(:,6)-x(:,7)-x(:,8);
    h(:,3) = x(:,9)-x(:,10)-x(:,11)-x(:,12);
    h(:,4) = x(:,14)-x(:,15)-x(:,16)-x(:,17);
    h(:,5) = x(:,18)-x(:,19)-x(:,20);
    h(:,6) = x(:,6).*x(:,21)-x(:,24).*x(:,25);
    h(:,7) = x(:,14).*x(:,22)-x(:,26).*x(:,27);
    h(:,8) = x(:,9).*x(:,23)-x(:,28).*x(:,29);
    h(:,9) = x(:,18).*x(:,30)-x(:,31).*x(:,32);
    h(:,10) = x(:,25)-x(:,5).*x(:,33);
    h(:,11) = x(:,29)-x(:,5).*x(:,34);
    h(:,12) = x(:,35)-x(:,5).*x(:,36);
    h(:,13) = x(:,37)-x(:,13).*x(:,38);
    h(:,14) = x(:,27)-x(:,13).*x(:,39);
    h(:,15) = x(:,32)-x(:,13).*x(:,40);
    h(:,16) = x(:,25)-x(:,6).*x(:,21)-x(:,9).*x(:,41);
    h(:,17) = x(:,29)-x(:,6).*x(:,42)-x(:,9).*x(:,23);
    h(:,18) = x(:,35)-x(:,6).*x(:,43)-x(:,9).*x(:,44);
    h(:,19) = x(:,37)-x(:,14).*x(:,45)-x(:,18).*x(:,46);
    h(:,20) = x(:,27)-x(:,14).*x(:,22)-x(:,18).*x(:,47);
    h(:,21) = x(:,32)-x(:,14).*x(:,48)-x(:,18).*x(:,30);
    h(:,22) = 1/3*x(:,1)+x(:,15).*x(:,45)-x(:,25);
    h(:,23) = 1/3*x(:,1)+x(:,15).*x(:,22)-x(:,29);
    h(:,24) = 1/3*x(:,1)+x(:,15).*x(:,48)-x(:,35);
    h(:,25) = 1/3*x(:,2)+x(:,10).*x(:,41)-x(:,37);
    h(:,26) = 1/3*x(:,2)+x(:,10).*x(:,23)-x(:,27);
    h(:,27) = 1/3*x(:,2)+x(:,10).*x(:,44)-x(:,32);
    h(:,28) = x(:,33)+x(:,34)+x(:,36)-1;
    h(:,29) = x(:,21)+x(:,42)+x(:,43)-1;
    h(:,30) = x(:,41)+x(:,23)+x(:,44)-1;
    h(:,31) = x(:,38)+x(:,39)+x(:,40)-1;
    h(:,32) = x(:,45)+x(:,22)+x(:,48)-1;
    h(:,33) = x(:,46)+x(:,47)+x(:,30)-1;
    h(:,34) = x(:,43);
    h(:,35) = x(:,46);
    h(:,36) = 1/3*x(:,3)+x(:,7).*x(:,21)+x(:,11).*x(:,41)+x(:,16).*x(:,45)+x(:,19).*x(:,46)-30;
    h(:,37) = 1/3*x(:,3)+x(:,7).*x(:,42)+x(:,11).*x(:,23)+x(:,16).*x(:,22)+x(:,19).*x(:,47)-50;
    h(:,38) = 1/3*x(:,3)+x(:,7).*x(:,43)+x(:,11).*x(:,44)+x(:,16).*x(:,48)+x(:,19).*x(:,30)-30;
end

%% Process Synthesis and Design Problems		

if(prob_k == 8)
    %% Process synthesis problem
    x(:,2) = round(x(:,2));
    f = 2*x(:,1) + x(:,2);
    g(:,1) = 1.25 - x(:,1).^2 - x(:,2);
    g(:,2) = x(:,1) + x(:,2) - 1.6;
    h = zeros(ps,1);
end

if(prob_k == 9)
    %% Process synthesis and design problem
    x(:,3) = round(x(:,3));
    f = -x(:,3) + 2*x(:,1) + x(:,2);
    h = x(:,1) - 2*exp(-x(:,2));
    g = -x(:,1)+x(:,2)+x(:,3);
end

if(prob_k == 10)
    %% Process flow sheeting problem
    x(:,3) = round(x(:,3));
    f = -0.7*x(:,3) + 5*(x(:,1)-0.5).^2 + 0.8;
    g(:,1) = -exp(x(:,1) - 0.2) - x(:,2);
    g(:,2) = x(:,2) + 1.1*x(:,3) + 1;
    g(:,3) = x(:,1) - x(:,3) -0.2;
    h = zeros(ps,1);
end

if(prob_k == 11)
    %% Two-reactor Problem
        x1 = x(:,1);
        x2 = x(:,2);
        v1 = x(:,3);
        v2 = x(:,4);
        y1 = round(x(:,5));
        y2 = round(x(:,6));
        x_ = x(:,7);
        
        z1 = 0.9*(1-exp(-0.5.*v1)).*x1;
        z2 = 0.8*(1-exp(-0.4*v2)).*x2;
        
        
        f = 7.5.*y1 + 5.5.*y2 + 7.*v1 + 6.*v2 + 5.*x_;
        
        h(:,1) = y1 + y2 - 1;
        h(:,2) = z1 + z2 - 10;
        h(:,3) = x1 + x2 -x_;
        h(:,4) = z1.*y1 + z2.*y2 - 10;
        g(:,1) = v1 - 10*y1;
        g(:,2) = v2 - 10*y2;
        g(:,3) = x1 - 20*y1;
        g(:,4) = x2 - 20*y2;
end

if(prob_k == 12)
    %% Process synthesis problem
        x1 = x(:,1);
        x2 = x(:,2);
        x3 = x(:,3);
        y1 = round(x(:,4));
        y2 = round(x(:,5));
        y3 = round(x(:,6));
        y4 = round(x(:,7));
        f = (y1-1).^2 + (y2-1).^2 + (y3-1).^2 - log(y4+1) + (x1-1).^22 + (x2-2).^2 + (x3-3).^2;
        g(:,1) = x1 + x2 + x3 + y1 + y2 + y3 - 5;
        g(:,2) = y3.^2 + x1.^2 + x2.^2 + x3.^2 - 5.5;
        g(:,3) = x1 + y1 - 1.2;
        g(:,4) = x2 + y2 - 1.8;
        g(:,5) = x3 + y3 - 2.5;
        g(:,6) = x1 + y4 - 1.2;
        g(:,7) = y2.^2 + x2.^2 - 1.64;
        g(:,8) = y3.^2 + x3.^2 - 4.25;
        g(:,9) = y2.^2 + x3.^2 - 4.64;
        h = zeros(ps,1);
end

if(prob_k == 13)
    %% Process design Problem
        x1 = x(:,1);
        x2 = x(:,2);
        x3 = x(:,3);
        y1 = round(x(:,4));
        y2 = round(x(:,5));
        f = -5.357854*x1.^2 - 0.835689*y1.*x3 - 37.29329*y1 + 40792.141;
        a = [85.334407,0.0056858,0.0006262,0.0022053,80.51249, 0.0071317,....
                                                  0.0029955,0.0021813,9.300961,0.0047026,0.0012547,0.0019085];
        g(:,1) = a(1) + a(2)*y2.*x3 + a(3)*y1.*x2 - a(4)*y1.*y1.*x3 - 92;
        g(:,2) = a(5) + a(6)*y2.*x3 + a(7)*y1.*x2 + a(8)*x1.^2 -90 -20;
        g(:,3) = a(9) + a(10)*y1.*x2 + a(11)*y1.*x1 + a(12)*x1.*x2 - 20 - 5;
        h = zeros(ps,1);
end


if(prob_k == 14)
    %% Multi-product batch plant
    %% constant
   S = [2,3,4;
        4,6,3];
   t = [8,20,8;
        16,4,4];
   H = 6000; alp = 250; beta = 0.6;
   Q1 = 40000; Q2 = 20000;
   %% decision Variable
   N1 = round(x(:,1)); N2 = round(x(:,2)); N3 = round(x(:,3));
   V1 = x(:,4); V2 = x(:,5); V3 = x(:,6);
   TL1 = x(:,7); TL2 = x(:,8);
   B1 = x(:,9); B2 = x(:,10);
   %% objective function
   f = alp.*(N1.*V1.^beta+N2.*V2.^beta+N3.*V3.^beta);
   %% constraints
   g(:,1) = Q1.*TL1./B1+Q2.*TL2./B2-H;
   g(:,2) = S(1,1).*B1+S(2,1).*B2-V1;
   g(:,3) = S(1,2).*B1+S(2,2).*B2-V2;
   g(:,4) = S(1,3).*B1+S(2,3).*B2-V3;
   g(:,5) = t(1,1)-N1.*TL1;
   g(:,6) = t(1,2)-N2.*TL1;
   g(:,7) = t(1,3)-N3.*TL1;
   g(:,8) = t(2,1)-N1.*TL2;
   g(:,9) = t(2,2)-N2.*TL2;
   g(:,10) = t(2,3)-N3.*TL2;
   h = zeros(ps,1);
end

%% Mechanical Engineering Problem		

if(prob_k == 15)
    %% Weight Minimization of a Speed Reducer
    f = 0.7854*x(:,1).*x(:,2).^2.*(3.3333.*x(:,3).^2+14.9334.*x(:,3)-43.0934)-1.508.*x(:,1).*(x(:,6).^2+x(:,7).^2).....
        +7.477.*(x(:,6).^3+x(:,7).^3)+0.7854.*(x(:,4).*x(:,6).^2+x(:,5).*x(:,7).^2);
  
    g(:,1) = -x(:,1).*x(:,2).^2.*x(:,3)+27;
    g(:,2) = -x(:,1).*x(:,2).^2.*x(:,3).^2+397.5;
    g(:,3) = -x(:,2).*x(:,6).^4.*x(:,3).*x(:,4).^(-3)+1.93;
    g(:,4) = -x(:,2).*x(:,7).^4.*x(:,3)./x(:,5).^3+1.93;
    g(:,5) = 10.*x(:,6).^(-3).*sqrt(16.91.*10^6+(745.*x(:,4)./(x(:,2).*x(:,3))).^2)-1100;
    g(:,6) = 10.*x(:,7).^(-3).*sqrt(157.5.*10^6+(745.*x(:,5)./(x(:,2).*x(:,3))).^2)-850;
    g(:,7) = x(:,2).*x(:,3)-40;
    g(:,8) = -x(:,1)./x(:,2)+5;
    g(:,9) = x(:,1)./x(:,2)-12;
    g(:,10) = 1.5.*x(:,6)-x(:,4)+1.9;
    g(:,11) = 1.1.*x(:,7)-x(:,5)+1.9;
    h = zeros(ps,1);
end

if(prob_k == 16)
    %% Optimal Design of Industrial refrigeration System
    f = 63098.88.*x(:,2).*x(:,4).*x(:,12)+5441.5.*x(:,2).^2.*x(:,12)+115055.5.*x(:,2).^1.664.*x(:,6).....
        +6172.27.*x(:,2).^2.*x(:,6)+63098.88.*x(:,1).*x(:,3).*x(:,11)+5441.5.*x(:,1).^2.*x(:,11).....
        +115055.5.*x(:,1).^1.664.*x(:,5)+6172.27.*x(:,1).^2.*x(:,5)+140.53.*x(:,1).*x(:,11)+281.29.*x(:,3).*x(:,11)....
        +70.26.*x(:,1).^2+281.29.*x(:,1).*x(:,3)+281.29.*x(:,3).^2+14437.*x(:,8).^1.8812.*x(:,12).^0.3424....
        .*x(:,10).*x(:,14).^(-1).*x(:,1).^2.*x(:,7).*x(:,9).^(-1)+20470.2.*x(:,7).^(2.893).*x(:,11).^0.316.*x(:,1).^2;
    g(:,1) = 1.524.*x(:,7).^(-1)-1;
    g(:,2) = 1.524.*x(:,8).^(-1)-1;
    g(:,3) = 0.07789.*x(:,1)-2.*x(:,7).^(-1).*x(:,9)-1;
    g(:,4) = 7.05305.*x(:,9).^(-1).*x(:,1).^2.*x(:,10).*x(:,8).^(-1).*x(:,2).^(-1).*x(:,14).^(-1)-1;
    g(:,5) = 0.0833./x(:,13).*x(:,14)-1;
    g(:,6) = 0.04771.*x(:,10).*x(:,8).^1.8812.*x(:,12).^0.3424-1;
    g(:,7) = 0.0488.*x(:,9).*x(:,7).^1.893.*x(:,11).^0.316-1;
    g(:,8) = 0.0099.*x(:,1)./x(:,3)-1;
    g(:,9) = 0.0193.*x(:,2)./x(:,4)-1;
    g(:,10) = 0.0298.*x(:,1)./x(:,5)-1;
    g(:,11) = 47.136.*x(:,2).^0.333./x(:,10).*x(:,12)-1.333.*x(:,8).*x(:,13).^2.1195+62.08.*x(:,13).^2.1195.*x(:,8).^0.2./(x(:,12).*x(:,10))-1;
    g(:,12) = 0.056.*x(:,2)./x(:,6)-1;
    g(:,13) = 2./x(:,9)-1;
    g(:,14) = 2./x(:,10)-1;
    g(:,15) = x(:,12)./x(:,11)-1;
    h =zeros(ps,1);
end

if(prob_k == 17)
    %% Tension/compression  spring  design (case 1)
    f = x(:,1).^2.*x(:,2).*(x(:,3)+2);
    h = zeros(ps,1);
    g(:,1) = 1-(x(:,2).^3.*x(:,3))./(71785.*x(:,1).^4);
    g(:,2) = (4.*x(:,2).^2-x(:,1).*x(:,2))./(12566.*(x(:,2).*x(:,1).^3-x(:,1).^4))....
             + 1./(5108.*x(:,1).^2)-1;
    g(:,3) = 1-140.45.*x(:,1)./(x(:,2).^2.*x(:,3));
    g(:,4) = (x(:,1)+x(:,2))./1.5-1;
    
    
%         f = x(:,1).^2.*x(:,2).*(x(:,3)+2);
%     h = zeros(ps,1);
%     g(:,1) = 1-(x(:,2).^3.*x(:,3))./(71785.*x(:,1).^4);
%     g(:,2) = (4.*x(:,2).^2-x(:,1).*x(:,2))./(12566.*(x(:,2).*x(:,1).^3-x(:,1).^4))....
%         + 1./(5108.*x(:,1).^2)-1;
%     g(:,3) = 1-140.45.*x(:,1)./(x(:,2).^2.*x(:,3));
%     g(:,4) = (x(:,1)+x(:,2))./1.5-1;
end

if(prob_k == 18)
    %% update
    x(:,1) = 0.0625.*round(x(:,1));
    x(:,2) = 0.0625.*round(x(:,2));
    %% Pressure vessel design
    f = 0.6224.*x(:,1).*x(:,3).*x(:,4)+1.7781.*x(:,2).*x(:,3).^2....
        +3.1661.*x(:,1).^2.*x(:,4)+19.84.*x(:,1).^2.*x(:,3);
    g(:,1) = -x(:,1)+0.0193.*x(:,3);
    g(:,2) = -x(:,2)+0.00954.*x(:,3);
    g(:,3) = -pi.*x(:,3).^2.*x(:,4)-4/3.*pi.*x(:,3).^3+1296000;
    g(:,4) = x(:,4)-240;
    h = zeros(ps,1);
end

if(prob_k == 19)
    %% Welded beam design
    f = 1.10471.*x(:,1).^2.*x(:,2)+0.04811.*x(:,3).*x(:,4).*(14+x(:,2));
    h = zeros(ps,1);
    P = 6000; L = 14; delta_max = 0.25; E = 30*1e6; G = 12*1e6; 
    T_max = 13600; sigma_max = 30000;
    Pc = 4.013.*E.*sqrt(x(:,3).^2.*x(:,4).^6/30)./L.^2.*(1-x(:,3)./(2*L).*sqrt(E/(4.*G)));
    sigma = 6.*P.*L./(x(:,4).*x(:,3).^2);
    delta = 6.*P.*L.^3./(E.*x(:,3).^2.*x(:,4));
    J = 2.*(sqrt(2).*x(:,1).*x(:,2).*(x(:,2).^2/4+(x(:,1)+x(:,3)).^2./4));
    R = sqrt(x(:,2).^2/4+(x(:,1)+x(:,3)).^2/4);
    M = P.*(L+x(:,2)/2);
    ttt = M.*R./J;
    tt = P./(sqrt(2).*x(:,1).*x(:,2));
    t  = sqrt(tt.^2+2.*tt.*ttt.*x(:,2)./(2.*R)+ttt.^2);
    %% constraints
    g(:,1) = t-T_max;
    g(:,2) = sigma-sigma_max;
    g(:,3) = x(:,1)-x(:,4);
    g(:,4) = delta-delta_max;
    g(:,5) = P-Pc;
end

if(prob_k == 20)
    %% Three-bar truss design problem
    f = (2.*sqrt(2).*x(:,1)+x(:,2))*100;
    g(:,1) = (sqrt(2).*x(:,1)+x(:,2))./(sqrt(2).*x(:,1).^2+2.*x(:,1).*x(:,2))*2-2;
    g(:,2) = x(:,2)./(sqrt(2).*x(:,1).^2+2.*x(:,1).*x(:,2))*2-2;
    g(:,3) = 1./(sqrt(2).*x(:,2)+x(:,1))*2-2;
    h      = zeros(ps,1);
end

if(prob_k == 21)
    %% Multiple disk clutch brake design problem
    %% parameters
   Mf = 3; Ms = 40; Iz = 55; n = 250; Tmax = 15; s = 1.5; delta = 0.5; 
   Vsrmax = 10; rho = 0.0000078; pmax = 1; mu = 0.6; Lmax = 30; delR = 20;
   Rsr = 2./3.*(x(:,2).^3-x(:,1).^3)./(x(:,2).^2.*x(:,1).^2);
   Vsr = pi.*Rsr.*n./30;
   A   = pi.*(x(:,2).^2-x(:,1).^2);
   Prz = x(:,4)./A;
   w   = pi.*n./30;
   Mh  = 2/3.*mu.*x(:,4).*x(:,5).*(x(:,2).^3-x(:,1).^3)./(x(:,2).^2-x(:,1).^2);
   T   = Iz.*w./(Mh+Mf);
   %%
   f = pi.*(x(:,2).^2-x(:,1).^2).*x(:,3).*(x(:,5)+1).*rho;
   g(:,1) = -x(:,2)+x(:,1)+delR;
   g(:,2) = (x(:,5)+1).*(x(:,3)+delta)-Lmax;
   g(:,3) = Prz-pmax;
   g(:,4) = Prz.*Vsr-pmax.*Vsrmax;
   g(:,5) = Vsr-Vsrmax;
   g(:,6) = T-Tmax;
   g(:,7) = s.*Ms-Mh;
   g(:,8) = -T;
   h      = zeros(ps,1);
end

if(prob_k == 22)
    %% Planetary gear train design optimization problem
    %% parameter Initialization
   x = round(abs(x)); Pind = [3,4,5]; mind = [ 1.75, 2, 2.25, 2.5, 2.75, 3.0];
   N1 = x(:,1); N2 = x(:,2); N3 = x(:,3); N4 = x(:,4); N5 = x(:,5); N6 = x(:,6);
   p  = Pind(:,x(:,7))'; m1 = mind(:,x(:,8))';m2 = mind(:,x(:,9))';
    %% objective function
    i1 = N6./N4; i01 = 3.11;
    i2 = N6.*(N1.*N3+N2.*N4)./(N1.*N3.*(N6-N4)); i02 = 1.84;
    iR = -(N2.*N6./(N1.*N3)); i0R = -3.11;
    f  = max([i1-i01,i2-i02,iR-i0R],[],2);
    %% constraints
    Dmax = 220; dlt22 = 0.5; dlt33 = 0.5; dlt55 = 0.5; dlt35 = 0.5; dlt34 = 0.5; dlt56 = 0.5;
    beta = acos(((N6-N3).^2+(N4+N5).^2-(N3+N5).^2)./(2.*(N6-N3).*(N4+N5)));
    g(:,1) = m2.*(N6+2.5)-Dmax;
    g(:,2) = m1.*(N1+N2)+m1.*(N2+2)-Dmax;
    g(:,3) = m2.*(N4+N5)+m2.*(N5+2)-Dmax;
    g(:,4) = abs(m1.*(N1+N2)-m2.*(N6-N3))-m1-m2;
    g(:,5) = -((N1+N2).*sin(pi./p)-N2-2-dlt22);
    g(:,6) = -((N6-N3).*sin(pi./p)-N3-2-dlt33);
    g(:,7) = -((N4+N5).*sin(pi./p)-N5-2-dlt55);
    if beta == real(beta)
       g(:,8) = (N3+N5+2+dlt35).^2-((N6-N3).^2+(N4+N5).^2-2.*(N6-N3).*(N4+N5).*cos(2.*pi./p-beta));
    else
       g(:,8) = 1e6;
    end
    g(:,9) = -(N6-2.*N3-N4-4-2.*dlt34);
    g(:,10) = -(N6-N4-2.*N5-4-2.*dlt56);
    h(:,1)  = rem(N6-N4,p);
end

if(prob_k == 23)
    %% Step-cone pulley problem
    %% parameter Initialization
    d1 = x(:,1)*1e-3; d2 = x(:,2)*1e-3; d3 = x(:,3)*1e-3; d4 = x(:,4)*1e-3; w = x(:,5)*1e-3;
    N = 350; N1 = 750; N2 = 450; N3 = 250; N4 = 150;
    rho = 7200; a = 3; mu = 0.35; s = 1.75*1e6; t = 8*1e-3;
    %% objective function
    f = rho.*w.*pi./4.*(d1.^2.*(1+(N1./N).^2)+d2.^2.*(1+(N2./N).^2)+d3.^2.*(1+(N3./N).^2)+d4.^2.*(1+(N4./N).^2));
    %% constraint
    C1 = pi.*d1./2.*(1+N1./N)+(N1./N-1).^2.*d1.^2./(4.*a)+2.*a;
    C2 = pi.*d2./2.*(1+N2./N)+(N2./N-1).^2.*d2.^2./(4.*a)+2.*a;
    C3 = pi.*d3./2.*(1+N3./N)+(N3./N-1).^2.*d3.^2./(4.*a)+2.*a;
    C4 = pi.*d4./2.*(1+N4./N)+(N4./N-1).^2.*d4.^2./(4.*a)+2.*a;
    R1 = exp(mu.*(pi-2.*asin((N1./N-1).*d1./(2.*a))));
    R2 = exp(mu.*(pi-2.*asin((N2./N-1).*d2./(2.*a))));
    R3 = exp(mu.*(pi-2.*asin((N3./N-1).*d3./(2.*a))));
    R4 = exp(mu.*(pi-2.*asin((N4./N-1).*d4./(2.*a))));
    P1 = s.*t.*w.*(1-exp(-mu.*(pi-2.*asin((N1/N-1).*d1/(2.*a))))).*pi.*d1.*N1./60;
    P2 = s.*t.*w.*(1-exp(-mu.*(pi-2.*asin((N2/N-1).*d2/(2.*a))))).*pi.*d2.*N2./60;
    P3 = s.*t.*w.*(1-exp(-mu.*(pi-2.*asin((N3/N-1).*d3/(2.*a))))).*pi.*d3.*N3./60;
    P4 = s.*t.*w.*(1-exp(-mu.*(pi-2.*asin((N4/N-1).*d4/(2.*a))))).*pi.*d4.*N4./60;
    
    g(:,1) = -R1+2;
    g(:,2) = -R2+2;
    g(:,3) = -R3+2;
    g(:,4) = -R4+2;
    g(:,5) = -P1+(0.75*745.6998);
    g(:,6) = -P2+(0.75*745.6998);
    g(:,7) = -P3+(0.75*745.6998);
    g(:,8) = -P4+(0.75*745.6998);
    h(:,1) = C1-C2;
    h(:,2) = C1-C3;
    h(:,3) = C1-C4;
end

if(prob_k == 24)
    %% Robot gripper problem
   a = x(:,1); b = x(:,2); c = x(:,3); e = x(:,4); ff = x(:,5); l = x(:,6); delta = x(:,7);
   Ymin = 50; Ymax = 100; YG = 150; Zmax = 99.9999; P = 100;
   alpha_0 = acos((a.^2+l.^2+e.^2-b.^2)./(2.*a.*sqrt(l.^2+e.^2)))+atan(e./l);
   beta_0  = acos((b.^2+l.^2+e.^2-a.^2)./(2.*b.*sqrt(l.^2+e.^2)))-atan(e./l);
   alpha_m = acos((a.^2+(l-Zmax).^2+e.^2-b.^2)./(2.*a.*sqrt((l-Zmax).^2+e.^2)))+atan(e./(l-Zmax));
   beta_m  = acos((b.^2+(l-Zmax).^2+e.^2-a.^2)./(2.*b.*sqrt((l-Zmax).^2+e.^2)))-atan(e./(l-Zmax));
   %% objective function
   for i = 1:ps
       f(i,1) = -OBJ11(x(i,:),2)-OBJ11(x(i,:),1);
   end
   %% constraints
   Yxmin = 2.*(e+ff+c.*sin(beta_m+delta));
   Yxmax = 2.*(e+ff+c.*sin(beta_0+delta));
   g(:,1) = Yxmin-Ymin;
   g(:,2) = -Yxmin;
   g(:,3) = Ymax-Yxmax;
   g(:,4) = Yxmax-YG;
   g(:,5) = l.^2+e.^2-(a+b).^2;
   g(:,6) = b.^2-(a-e).^2-(l-Zmax).^2;
   g(:,7) = Zmax-l;
   h      = zeros(ps,1);
   tt     = imag(f)~=0;
   f(tt)  = 1e4;
   tt     = imag(g)~=0;
   g(tt)  = 1e4;
end

if (prob_k == 25)
    %% Hydro-static thrust bearing design problem
    R = x(:,1); Ro = x(:,2);  mu = x(:,3); Q = x(:,4);
    gamma = 0.0307; C = 0.5; n = -3.55; C1 = 10.04;
    Ws = 101000; Pmax = 1000; delTmax = 50; hmin = 0.001;
    gg = 386.4; N = 750;
    P    = (log10(log10(8.122*1e6.*mu+0.8))-C1)./n;
    delT = 2.*(10.^P-560);
    Ef   = 9336.*Q.*gamma.*C.*delT;
    h    = (2.*pi.*N./60).^2.*2.*pi.*mu./Ef.*(R.^4./4-Ro.^4./4)-1e-5;
    Po   = (6.*mu.*Q./(pi.*h.^3)).*log(R./Ro);
    W    = pi.*Po./2.*(R.^2-Ro.^2)./(log(R./Ro)-1e-5);
    %%  objective function
    f = (Q.*Po./0.7+Ef)./12;
    %%  constraints
    g(:,1) = Ws-W;
    g(:,2) = Po-Pmax;
    g(:,3) = delT-delTmax;
    g(:,4) = hmin-h;
    g(:,5) = Ro-R;
    g(:,6) = gamma./(gg.*Po).*(Q./(2.*pi.*R.*h))-0.001;
    g(:,7) = W./(pi.*(R.^2-Ro.^2)+1e-5)-5000;
    h      = zeros(ps,1);
end

if (prob_k == 26)
    %% Four-stage gear box problem
    %% parameter initialized
    x = round(x);
    Np1 = x(:,1); Ng1 = x(:,2); Np2 = x(:,3); Ng2 = x(:,4);
    Np3 = x(:,5); Ng3 = x(:,6); Np4 = x(:,7); Ng4 = x(:,8);
    Pvalue = [ 3.175, 5.715, 8.255, 12.7];
    b1 = Pvalue(x(:,9))'; b2 = Pvalue(x(:,10))'; b3 = Pvalue(x(:,11))';
    b4 = Pvalue(x(:,12))';
    XYvalue = [ 12.7,25.4,38.1,50.8,63.5,76.2,88.9,101.6,114.3];
    xp1 = XYvalue(x(:,13))'; xg1 = XYvalue(x(:,14))';
    xg2 = XYvalue(x(:,15))'; xg3 = XYvalue(x(:,16))';
    xg4 = XYvalue(x(:,17))'; yp1 = XYvalue(x(:,18))';
    yg1 = XYvalue(x(:,19))'; yg2 = XYvalue(x(:,20))';
    yg3 = XYvalue(x(:,21))'; yg4 = XYvalue(x(:,22))';
    %% value initilized
    c1 = sqrt((xg1-xp1).^2+(yg1-yp1).^2);
    c2 = sqrt((xg2-xp1).^2+(yg2-yp1).^2);
    c3 = sqrt((xg3-xp1).^2+(yg3-yp1).^2);
    c4 = sqrt((xg4-xp1).^2+(yg4-yp1).^2);
    CRmin = 1.4; dmin = 25.4; phi = 20.*pi./180; W = 55.9; JR = 0.2; Km = 1.6; Ko = 1.5; Lmax = 127; 
    sigma_H = 3290; sigma_N = 2090; w1 = 5000; wmin = 245; wmax = 255; Cp = 464;
    %% objective function
    f = pi./1000.*(b1.*c1.^2.*(Np1.^2+Ng1.^2)./(Np1+Ng1).^2+b2.*c2.^2.*(Np2.^2+Ng2.^2)./(Np2+Ng2).^2......
        +b3.*c3.^2.*(Np3.^2+Ng3.^2)./(Np3+Ng3).^2+b4.*c4.^2.*(Np4.^2+Ng4.^2)./(Np4+Ng4).^2);
    %% constraints
    g(:,1) = (366000./(pi.*w1)+2.*c1.*Np1./(Np1+Ng1)).*((Np1+Ng1).^2./(4.*b1.*c1.^2.*Np1))-sigma_N.*JR./(0.0167.*W.*Ko.*Km);
    g(:,2) = (366000.*Ng1./(pi.*w1.*Np1)+2.*c2.*Np2./(Np2+Ng2)).*((Np2+Ng2).^2./(4.*b2.*c2.^2.*Np2))-sigma_N.*JR./(0.0167.*W.*Ko.*Km);
    g(:,3) = (366000.*Ng1.*Ng2./(pi.*w1.*Np1.*Np2)+2.*c3.*Np3./(Np3+Ng3)).*((Np3+Ng3).^2./(4.*b3.*c3.^2.*Np3))-sigma_N.*JR./(0.0167.*W.*Ko.*Km);
    g(:,4) = (366000.*Ng1.*Ng2.*Ng3./(pi.*w1.*Np1.*Np2.*Np3)+2.*c4.*Np4./(Np4+Ng4)).*((Np4+Ng4).^2./(4.*b4.*c4.^2.*Np4))-sigma_N.*JR./(0.0167.*W.*Ko.*Km);
    g(:,5) = (366000./(pi.*w1)+2.*c1.*Np1./(Np1+Ng1)).*((Np1+Ng1).^3./(4.*b1.*c1.^2.*Ng1.*Np1.^2))-(sigma_H./Cp).^2.*(sin(phi).*cos(phi))./(0.0334.*W.*Ko.*Km);
    g(:,6) = (366000.*Ng1./(pi.*w1.*Np1)+2.*c2.*Np2./(Np2+Ng2)).*((Np2+Ng2).^3./(4.*b2.*c2.^2.*Ng2.*Np2.^2))-(sigma_H./Cp).^2.*(sin(phi).*cos(phi))./(0.0334.*W.*Ko.*Km);
    g(:,7) = (366000.*Ng1.*Ng2./(pi.*w1.*Np1.*Np2)+2.*c3.*Np3./(Np3+Ng3)).*((Np3+Ng3).^3./(4.*b3.*c3.^2.*Ng3.*Np3.^2))-(sigma_H./Cp).^2.*(sin(phi).*cos(phi))./(0.0334.*W.*Ko.*Km);
    g(:,8) = (366000.*Ng1.*Ng2.*Ng3./(pi.*w1.*Np1.*Np2.*Np3)+2.*c4.*Np4./(Np4+Ng4)).*((Np4+Ng4).^3./(4.*b4.*c4.^2.*Ng4.*Np4.^2))-(sigma_H./Cp).^2.*(sin(phi).*cos(phi))./(0.0334.*W.*Ko.*Km);
    g(:,9) = CRmin.*pi.*cos(phi) - Np1.*sqrt(sin(phi).^2./4+1./Np1+(1./Np1).^2)-Ng1.*sqrt(sin(phi).^2./4+1./Ng1+(1./Ng1).^2)+sin(phi).*(Np1+Ng1)./2;
    g(:,10) = CRmin.*pi.*cos(phi) - Np2.*sqrt(sin(phi).^2./4+1./Np2+(1./Np2).^2)-Ng2.*sqrt(sin(phi).^2./4+1./Ng2+(1./Ng2).^2)+sin(phi).*(Np2+Ng2)./2;
    g(:,11) = CRmin.*pi.*cos(phi) - Np3.*sqrt(sin(phi).^2./4+1./Np3+(1./Np3).^2)-Ng3.*sqrt(sin(phi).^2./4+1./Ng3+(1./Ng3).^2)+sin(phi).*(Np3+Ng3)./2;
    g(:,12) = CRmin.*pi.*cos(phi) - Np4.*sqrt(sin(phi).^2./4+1./Np4+(1./Np4).^2)-Ng4.*sqrt(sin(phi).^2./4+1./Ng4+(1./Ng4).^2)+sin(phi).*(Np4+Ng4)./2;
    g(:,13) = dmin - 2.*c1.*Np1./(Np1+Ng1);
    g(:,14) = dmin - 2.*c2.*Np2./(Np2+Ng2);
    g(:,15) = dmin - 2.*c3.*Np3./(Np3+Ng3);
    g(:,16) = dmin - 2.*c4.*Np4./(Np4+Ng4);
    g(:,17) = dmin - 2.*c1.*Ng1./(Np1+Ng1);
    g(:,18) = dmin - 2.*c2.*Ng2./(Np2+Ng2);
    g(:,19) = dmin - 2.*c3.*Ng3./(Np3+Ng3);
    g(:,20) = dmin - 2.*c4.*Ng4./(Np4+Ng4); 
    g(:,21) = xp1 +((Np1+2).*c1./(Np1+Ng1))-Lmax;
    g(:,22) = xg2 +((Np2+2).*c2./(Np2+Ng2))-Lmax;
    g(:,23) = xg3 +((Np3+2).*c3./(Np3+Ng3))-Lmax;
    g(:,24) = xg4 +((Np4+2).*c4./(Np4+Ng4))-Lmax;
    g(:,25) = -xp1 +((Np1+2).*c1./(Np1+Ng1));
    g(:,26) = -xg2 +((Np2+2).*c2./(Np2+Ng2));
    g(:,27) = -xg3 +((Np3+2).*c3./(Np3+Ng3));
    g(:,28) = -xg4 +((Np4+2).*c4./(Np4+Ng4));
    g(:,29) = yp1 +((Np1+2).*c1./(Np1+Ng1))-Lmax;
    g(:,30) = yg2 +((Np2+2).*c2./(Np2+Ng2))-Lmax;
    g(:,31) = yg3 +((Np3+2).*c3./(Np3+Ng3))-Lmax;
    g(:,32) = yg4 +((Np4+2).*c4./(Np4+Ng4))-Lmax;
    g(:,33) = -yp1 +((Np1+2).*c1./(Np1+Ng1));
    g(:,34) = -yg2 +((Np2+2).*c2./(Np2+Ng2));
    g(:,35) = -yg3 +((Np3+2).*c3./(Np3+Ng3));
    g(:,36) = -yg4 +((Np4+2).*c4./(Np4+Ng4));
    g(:,37) = xg1 +((Ng1+2).*c1./(Np1+Ng1))-Lmax;
    g(:,38) = xg2 +((Ng2+2).*c2./(Np2+Ng2))-Lmax;
    g(:,39) = xg3 +((Ng3+2).*c3./(Np3+Ng3))-Lmax;
    g(:,40) = xg4 +((Ng4+2).*c4./(Np4+Ng4))-Lmax;
    g(:,41) = -xg1 +((Ng1+2).*c1./(Np1+Ng1));
    g(:,42) = -xg2 +((Ng2+2).*c2./(Np2+Ng2));
    g(:,43) = -xg3 +((Ng3+2).*c3./(Np3+Ng3));
    g(:,44) = -xg4 +((Ng4+2).*c4./(Np4+Ng4));
    g(:,45) = yg1 +((Ng1+2).*c1./(Np1+Ng1))-Lmax;
    g(:,46) = yg2 +((Ng2+2).*c2./(Np2+Ng2))-Lmax;
    g(:,47) = yg3 +((Ng3+2).*c3./(Np3+Ng3))-Lmax;
    g(:,48) = yg4 +((Ng4+2).*c4./(Np4+Ng4))-Lmax;
    g(:,49) = -yg1 +((Ng1+2).*c1./(Np1+Ng1));
    g(:,50) = -yg2 +((Ng2+2).*c2./(Np2+Ng2));
    g(:,51) = -yg3 +((Ng3+2).*c3./(Np3+Ng3));
    g(:,52) = -yg4 +((Ng4+2).*c4./(Np4+Ng4));
    g(:,53) = (0.945.*c1-Np1-Ng1).*(b1-5.715).*(b1-8.255).*(b1-12.70).*(-1);
    g(:,54) = (0.945.*c2-Np2-Ng2).*(b2-5.715).*(b2-8.255).*(b2-12.70).*(-1);
    g(:,55) = (0.945.*c3-Np3-Ng3).*(b3-5.715).*(b3-8.255).*(b3-12.70).*(-1);
    g(:,56) = (0.945.*c4-Np4-Ng4).*(b4-5.715).*(b4-8.255).*(b4-12.70).*(-1);
    g(:,57) = (0.646.*c1-Np1-Ng1).*(b1-3.175).*(b1-8.255).*(b1-12.70).*(+1);
    g(:,58) = (0.646.*c2-Np2-Ng2).*(b2-3.175).*(b2-8.255).*(b2-12.70).*(+1);
    g(:,59) = (0.646.*c3-Np3-Ng3).*(b3-3.175).*(b3-8.255).*(b3-12.70).*(+1);
    g(:,60) = (0.646.*c4-Np4-Ng4).*(b4-3.175).*(b4-8.255).*(b4-12.70).*(+1);
    g(:,61) = (0.504.*c1-Np1-Ng1).*(b1-3.175).*(b1-5.715).*(b1-12.70).*(-1);
    g(:,62) = (0.504.*c2-Np2-Ng2).*(b2-3.175).*(b2-5.715).*(b2-12.70).*(-1);
    g(:,63) = (0.504.*c3-Np3-Ng3).*(b3-3.175).*(b3-5.715).*(b3-12.70).*(-1);
    g(:,64) = (0.504.*c4-Np4-Ng4).*(b4-3.175).*(b4-5.715).*(b4-12.70).*(-1);
    g(:,65) = (0.0.*c1-Np1-Ng1).*(b1-3.175).*(b1-5.715).*(b1-8.255).*(+1);
    g(:,66) = (0.0.*c2-Np2-Ng2).*(b2-3.175).*(b2-5.715).*(b2-8.255).*(+1);
    g(:,67) = (0.0.*c3-Np3-Ng3).*(b3-3.175).*(b3-5.715).*(b3-8.255).*(+1);
    g(:,68) = (0.0.*c4-Np4-Ng4).*(b4-3.175).*(b4-5.715).*(b4-8.255).*(+1);
    g(:,69) = (-1.812.*c1+Np1+Ng1).*(b1-5.715).*(b1-8.255).*(b1-12.70).*(-1);
    g(:,70) = (-1.812.*c2+Np2+Ng2).*(b2-5.715).*(b2-8.255).*(b2-12.70).*(-1);
    g(:,71) = (-1.812.*c3+Np3+Ng3).*(b3-5.715).*(b3-8.255).*(b3-12.70).*(-1);
    g(:,72) = (-1.812.*c4+Np4+Ng4).*(b4-5.715).*(b4-8.255).*(b4-12.70).*(-1);
    g(:,73) = (-0.945.*c1+Np1+Ng1).*(b1-3.175).*(b1-8.255).*(b1-12.70).*(+1);
    g(:,74) = (-0.945.*c2+Np2+Ng2).*(b2-3.175).*(b2-8.255).*(b2-12.70).*(+1);
    g(:,75) = (-0.945.*c3+Np3+Ng3).*(b3-3.175).*(b3-8.255).*(b3-12.70).*(+1);
    g(:,76) = (-0.945.*c4+Np4+Ng4).*(b4-3.175).*(b4-8.255).*(b4-12.70).*(+1);
    g(:,77) = (-0.646.*c1+Np1+Ng1).*(b1-3.175).*(b1-5.715).*(b1-12.70).*(-1);
    g(:,78) = (-0.646.*c2+Np2+Ng2).*(b2-3.175).*(b2-5.715).*(b2-12.70).*(-1);
    g(:,79) = (-0.646.*c3+Np2+Ng3).*(b3-3.175).*(b3-5.715).*(b3-12.70).*(-1);
    g(:,80) = (-0.646.*c4+Np3+Ng4).*(b4-3.175).*(b4-5.715).*(b4-12.70).*(-1);
    g(:,81) = (-0.504.*c1+Np1+Ng1).*(b1-3.175).*(b1-5.715).*(b1-8.255).*(+1);
    g(:,82) = (-0.504.*c2+Np2+Ng2).*(b2-3.175).*(b2-5.715).*(b2-8.255).*(+1);
    g(:,83) = (-0.504.*c3+Np3+Ng3).*(b3-3.175).*(b3-5.715).*(b3-8.255).*(+1);
    g(:,84) = (-0.504.*c4+Np4+Ng4).*(b4-3.175).*(b4-5.715).*(b4-8.255).*(+1);
    g(:,85) = wmin -w1.*(Np1.*Np2.*Np3.*Np4)./(Ng1.*Ng2.*Ng3.*Ng4);
    g(:,86) = -wmax +w1.*(Np1.*Np2.*Np3.*Np4)./(Ng1.*Ng2.*Ng3.*Ng4);
    g(g==inf) = 1e6;
    g(g==-inf) = 1e6;
    h       = zeros(ps,1);
end

if (prob_k == 27)
    %% 10-bar truss design
    f = zeros(ps,1);
    g = zeros(ps,3);
    h = zeros(ps,1);
    
    for i = 1:ps
      %% objective function 
      f(i,1) = function_fitness(x(i,:));
      %% constraint
      [c,~] = ConsBar10(x(i,:));
      g(i,:)  = c;
    end
end

if (prob_k == 28)
    %% Rolling element bearing
   Dm = x(:,1); Db = x(:,2); Z = round(x(:,3)); fi = x(:,4); fo = x(:,5);
   KDmin = x(:,6); KDmax = x(:,7); eps = x(:,8); e = x(:,9); chi = x(:,10);
   D = 160; d = 90; Bw = 30; T = D-d-2.*Db;
   phi_o = 2.*pi-2.*acos((((D-d).*0.5-0.75.*T).^2+(0.5.*D-0.25.*T-Db).^2-(0.5.*d+0.25.*T).^2)./(2.*(0.5.*(D-d)-0.75.*T).*(0.5.*D-0.25.*T-Db)));
   gamma = Db./Dm;
   fc    = 37.91.*(1+(1.04.*((1-gamma)./(1+gamma)).^1.72.*(fi.*(2.*fo-1)./(fo.*(2.*fi-1))).^0.41).^(10/3)).^(-0.3).....
          .*(gamma.^0.3.*(1-gamma).^1.39./(1+gamma).^(1./3)).*(2.*fi./(2.*fi-1)).^0.41;
   %% objective function
   ind    = find(Db > 25.4);
   f      = fc.*Z.^(2/3).*Db.^(1.8);
   f(ind) = 3.647.*fc(ind).*Z(ind).^(2/3).*Db(ind).^1.4;
   %% constraint
   g(:,1) = Z-1-phi_o./(2.*asin(Db./Dm));
   g(:,2) = KDmin.*(D-d)-2.*Db;
   g(:,3) = 2.*Db-KDmax.*(D-d);
   g(:,4) = chi.*Bw -Db;
   g(:,5) = 0.5.*(D+d)-Dm;
   g(:,6) = Dm-(0.5+e).*(D+d);
   g(:,7) = eps.*Db-0.5.*(D-Dm-Db);
   g(:,8) = 0.515 - fi;
   g(:,9) = 0.515 - fo;
   h      = zeros(ps,1);
end


if (prob_k == 29)
    %% Gas Transmission Compressor Design (GTCD)
    f = 8.61.*1e5.*x(:,1).^0.5.*x(:,2).*x(:,3).^(-2/3).*x(:,4).^(-1/2) +3.69.*1e4.*x(:,3)....
        + 7.72.*1e8.*x(:,1).^(-1).*x(:,2).^(0.219)-765.43.*1e6.*x(:,1).^(-1);
    h      = zeros(ps,1);
    g(:,1) = x(:,4).*x(:,2).^(-2)+x(:,2).^(-2)-1;
end

if(prob_k == 30)
    %% Tension/compression  spring  design (case 2)
        x1 = round(x(:,1));
        x2 = x(:,2);
        d  = [0.009,0.0095,0.0104,0.0118,0.0128,0.0132,0.014,....
              0.015, 0.0162, 0.0173, 0.018, 0.020, 0.023, 0.025,...
              0.028, 0.032, 0.035, 0.041, 0.047, 0.054, 0.063,....
              0.072, 0.080, 0.092, 0.0105, 0.120, 0.135, 0.148,....
              0.162, 0.177, 0.192, 0.207, 0.225, 0.244, 0.263,....
              0.283, 0.307, 0.331, 0.362,0.394,0.4375,0.500];
        x3 = d(round(x(:,3))); x3 = x3(:);
       
        %% objective function
        f = (pi.^2.*x2.*x3.^2.*(x1+2))./4;
        %% constants
        cf = (4.*x2./x3-1)./(4.*x2./x3-4)+0.615.*x3./x2;
        K  = (11.5.*10.^6.*x3.^4)./(8.*x1.*x2.^3);
        lf = 1000./K + 1.05.*(x1+2).*x3;
        sigp = 300./K;
        g(:,1) = (8000.*cf.*x2)./(pi.*x3.^3)-189000;
        g(:,2) = lf-14;
        g(:,3) = 0.2-x3;
        g(:,4) = x2-3;
        g(:,5) = 3-x2./x3;
        g(:,6) = sigp - 6;
        g(:,7) = sigp+700./K+1.05.*(x1+2).*x3-lf;
        g(:,8) = 1.25-700./K;
        h = zeros(ps,1);
end

if(prob_k == 31)
    %% Gear train  design Problem
        x1 = x(:,1);
        x2 = x(:,2);
        x3 = x(:,3);
        x4 = x(:,4);
        f = (1/6.931-(x1.*x2)./(x3.*x4)).^2;
        g = zeros(ps,1);
        h = zeros(ps,1);
end

if(prob_k == 32)
    %% Himmelblau's Function
        x1 = x(:,1);
        x2 = x(:,2);
        x3 = x(:,3);
        x4 = x(:,4);
        x5 = x(:,5);
        %% objective function
        f = 5.3578547.*x3.^2 + 0.8356891.*x1.*x5 + 37.293239.*x1 - 40792.141;
        %% parameters
        G1 = 85.334407 + 0.0056858.*x2.*x5 + 0.0006262.*x1.*x4 - 0.0022053.*x3.*x5;
        G2 = 80.51249 + 0.0071317.*x2.*x5 + 0.0029955.*x1.*x2 + 0.0021813.*x3.^2;
        G3 = 9.300961 + 0.0047026.*x3.*x5 + 0.0012547.*x1.*x3 + 0.0019085.*x3.*x4;
        %% constraint
        g(:,1) = G1-92;
        g(:,2) = -G1;
        g(:,3) = G2-110;
        g(:,4) = -G2+90;
        g(:,5) = G3-25;
        g(:,6) = -G3+20;
        h = zeros(ps,1);
end

if(prob_k == 33)
    %% Topology Optimization
     nely = 10;
     nelx = 3;
     penal = 3;
     for i = 1:ps
         X = [x(i,1:10);x(i,11:20);x(i,21:30)]';
         % FE-ANALYSIS
         [U]=FE(3,10,X,3);         
         % OBJECTIVE FUNCTION AND SENSITIVITY ANALYSIS
         [KE] = lk;
         c = 0.;
         for ely = 1:nely
             for elx = 1:nelx
                 n1 = (nely+1)*(elx-1)+ely; 
                 n2 = (nely+1)* elx   +ely;
                 Ue = U([2*n1-1;2*n1; 2*n2-1;2*n2; 2*n2+1;2*n2+2; 2*n1+1;2*n1+2],1);
                 c = c + X(ely,elx)^penal*Ue'*KE*Ue;
                 dc(ely,elx) = -penal*X(ely,elx)^(penal-1)*Ue'*KE*Ue;
             end
         end
         % FILTERING OF SENSITIVITIES
         [dc]   = check(3,10,1.5,X,dc); 
         f(i,1) = c;
         g(i,:) = dc(1:end);
     end
     h = zeros(ps,1);
end

%% Power System Problems		

if(prob_k == 34)
    %% Optimal Sizing of Single Phase Distributed Generation with reactive power support for Phase Balancing at Main Transformer/Grid
    if initial_flag == 0
        G = load('input data\FunctionPS1_G.txt');
        B = load('input data\FunctionPS1_B.txt');
        P = load('input data\FunctionPS1_P.txt');
        Q = load('input data\FunctionPS1_Q.txt');
        initial_flag = 1;
    end
    Y = G+1j*B;
    %% voltage initilization
    V = zeros(30,1);
    V(1)    = 1;
    V(2)    = exp(1j*4*pi/3);
    V(3)    = exp(1j*2*pi/3);
    Pdg     = zeros(30,1);
    Qdg     = zeros(30,1);
    Psp     = zeros(30,1);
    Qsp     = zeros(30,1);
    for i = 1:ps
        V(4:30)   = x(i,1:27)+1j*x(i,28:54);
        Psp(4:30) = x(i,55:81);
        Qsp(4:30) = x(i,82:108);
        Pdg([9,16,21,24,30]) = x(i,109:113);
        Qdg([9,16,21,24,30]) = x(i,114:118);
    %% current calculation
        I    = Y*V;
        Ir   = real(I);
        Im   = imag(I);
        spI  = conj((Psp+1j*Qsp)./V);
        spIr = real(spI);
        spIm = imag(spI);
        delP = Psp-Pdg-P;
        delQ = Qsp-Qdg-Q;
        delIr = Ir-spIr;
        delIm = Im-spIm;
    %% objective calculation
       f(i,1) = abs(I(1)+I(2)+I(3))+abs(I(1)+exp(1j*4*pi/3)*I(2)+exp(1j*2*pi/3)*I(3));
       h(i,:) = [delIr(4:30)',delIm(4:30)',delP(4:30)',delQ(4:30)'];
    end
    g = zeros(ps,1);
end

if(prob_k == 35)
    %% Optimal Sizing of Distributed Generation for Active Power Loss Minimization
    if initial_flag == 0
        G = load('input data\FunctionPS2_G.txt');
        B = load('input data\FunctionPS2_B.txt');
        P = load('input data\FunctionPS2_P.txt');
        Q = load('input data\FunctionPS2_Q.txt');
        initial_flag = 1;
    end
    Y = G+1j*B;
    %% voltage initilization
    V = zeros(38,1);
    V(1)    = 1;
    Pdg     = zeros(38,1);
%     Qdg     = zeros(38,1);
    Psp     = zeros(38,1);
    Qsp     = zeros(38,1);
    for i = 1:ps
        V(2:38)   = x(i,1:37)+1j*x(i,38:74);
        Psp(2:38) = x(i,75:111);
        Qsp(2:38) = x(i,112:148);
        Pdg([34,35,36,37,38]) = x(i,149:153);
%         Qdg([34,35,36,37,38]) = x(i,154:158);
    %% current calculation
        I    = Y*V;
        Ir   = real(I);
        Im   = imag(I);
        spI  = conj((Psp+1j*Qsp)./V);
        spIr = real(spI);
        spIm = imag(spI);
        delP = Psp-Pdg+P(:,1).*(abs(V)./P(:,5)).^P(:,6);
        delQ = Qsp+Q(:,1).*(abs(V)./Q(:,5)).^Q(:,6);
        delIr = Ir-spIr;
        delIm = Im-spIm;
    %% objective calculation
       f(i,1) = real(V(1).*conj(I(1)))+sum(Psp(2:38));
       h(i,:) = [delIr(2:38)',delIm(2:38)',delP(2:38)',delQ(2:38)'];
    end
    g = zeros(ps,1);
end

if(prob_k == 36)
    %% Optimal Sizing of Distributed Generation (DG) and Capacitors for Reactive Power Loss Minimization
    if initial_flag == 0
        G = load('input data\FunctionPS2_G.txt');
        B = load('input data\FunctionPS2_B.txt');
        P = load('input data\FunctionPS2_P.txt');
        Q = load('input data\FunctionPS2_Q.txt');
        initial_flag = 1;
    end
    Y = G+1j*B;
    %% voltage initilization
    V = zeros(38,1);
    V(1)    = 1;
    Pdg     = zeros(38,1);
    Qdg     = zeros(38,1);
    Psp     = zeros(38,1);
    Qsp     = zeros(38,1);
    for i = 1:ps
        V(2:38)   = x(i,1:37)+1j*x(i,38:74);
        Psp(2:38) = x(i,75:111);
        Qsp(2:38) = x(i,112:148);
        Pdg([34,35,36,37,38]) = x(i,149:153);
        Qdg([34,35,36,37,38]) = x(i,154:158);
    %% current calculation
        I    = Y*V;
        Ir   = real(I);
        Im   = imag(I);
        spI  = conj((Psp+1j*Qsp)./V);
        spIr = real(spI);
        spIm = imag(spI);
        delP = Psp-Pdg+P(:,1).*(abs(V)./P(:,5)).^P(:,6);
        delQ = Qsp-Qdg+Q(:,1).*(abs(V)./Q(:,5)).^Q(:,6);
        delIr = Ir-spIr;
        delIm = Im-spIm;
    %% objective calculation
       f(i,1) = 0.5.*(real(V(1).*conj(I(1)))+sum(Psp(2:38)))+0.5.*(imag(V(1).*conj(I(1)))+sum(Qsp(2:38)));
       h(i,:) = [delIr(2:38)',delIm(2:38)',delP(2:38)',delQ(2:38)'];
    end
    g = zeros(ps,1);
end

if(prob_k == 37)
    %% Optimal Power flow (Minimization of Active Power Loss)
    if initial_flag == 0
        G = load('input data\FunctionPS11_G.txt');
        B = load('input data\FunctionPS11_B.txt');
        P = load('input data\FunctionPS11_P.txt');
        Q = load('input data\FunctionPS11_Q.txt');
        initial_flag = 1;
    end
    Y = G+1j*B;
    %% voltage initilization
    V = zeros(30,1);
    V(1)    = 1;
    Pg      = zeros(30,1);
    Qg      = zeros(30,1);
    Psp     = zeros(30,1);
    Qsp     = zeros(30,1);
    for i = 1:ps
        V(2:30)   = x(i,1:29)+ 1j*x(i,30:58);
        Psp(2:30) = x(i,59:87);
        Qsp(2:30) = x(i,88:116);
        Pg([2,13,22,23,27]) = x(i,117:121);
        Qg([2,13,22,23,27]) = x(i,122:126);
    %% current calculation
        I    = Y*V;
        Ir   = real(I);
        Im   = imag(I);
        spI  = conj((Psp+1j*Qsp)./V);
        spIr = real(spI);
        spIm = imag(spI);
        delP = Psp-Pg+P;
        delQ = Qsp-Qg+Q;
        delIr = Ir-spIr;
        delIm = Im-spIm;
    %% objective calculation
       f(i,1) = real(V(1).*conj(I(1)))+sum(Psp(2:30));
       h(i,:) = [delIr(2:30)',delIm(2:30)',delP(2:30)',delQ(2:30)'];
    end
    g = zeros(ps,1);
end

if (prob_k == 38)
    %% Optimal Power flow (Minimization of Fuel Cost)
    if initial_flag == 0
        G = load('input data\FunctionPS11_G.txt');
        B = load('input data\FunctionPS11_B.txt');
        P = load('input data\FunctionPS11_P.txt');
        Q = load('input data\FunctionPS11_Q.txt');
        initial_flag = 1;
    end
    Y = G+1j*B;
    %% voltage initilization
    V = zeros(30,1);
    V(1)    = 1;
    Pg      = zeros(30,1);
    Qg      = zeros(30,1);
    Psp     = zeros(30,1);
    Qsp     = zeros(30,1);
    ng      = [1,2,13,22,23,27];
    a1      = [0,0,0,0,0,0];
    b1      = [ 2, 1.75,1,3.25,3,3];
    c1      = [ 0.02,0.0175,0.0625, 0.00834, 0.025, 0.0025];
    for i = 1:ps
        V(2:30)   = x(i,1:29)+ 1j*x(i,30:58);
        Psp(2:30) = x(i,59:87);
        Qsp(2:30) = x(i,88:116);
        Pg([2,13,22,23,27]) = x(i,117:121);
        Qg([2,13,22,23,27]) = x(i,122:126);
    %% current calculation
        I    = Y*V;
        Ir   = real(I);
        Im   = imag(I);
        spI  = conj((Psp+1j*Qsp)./V);
        spIr = real(spI);
        spIm = imag(spI);
        delP = Psp-Pg+P;
        delQ = Qsp-Qg+Q;
        delIr = Ir-spIr;
        delIm = Im-spIm;
        Pg(1)= real(V(1).*conj(I(1)));
    %% objective calculation
       f(i,1) = sum(a1 + b1.*Pg(ng)' + c1.*(Pg(ng).^2)');
       h(i,:) = [delIr(2:30)',delIm(2:30)',delP(2:30)',delQ(2:30)'];
    end
    g = zeros(ps,1);
end

if (prob_k == 39)
    %% Optimal Power flow (Minimization of Active Power Loss and Fuel Cost)
    if initial_flag == 0
        G = load('input data\FunctionPS11_G.txt');
        B = load('input data\FunctionPS11_B.txt');
        P = load('input data\FunctionPS11_P.txt');
        Q = load('input data\FunctionPS11_Q.txt');
        initial_flag = 1;
    end
    Y = G+1j*B;
    %% voltage initilization
    V = zeros(30,1);
    V(1)    = 1;
    Pg      = zeros(30,1);
    Qg      = zeros(30,1);
    Psp     = zeros(30,1);
    Qsp     = zeros(30,1);
    ng      = [1,2,13,22,23,27];
    a1      = [0,0,0,0,0,0];
    b1      = [ 2, 1.75,1,3.25,3,3];
    c1      = [ 0.02,0.0175,0.0625, 0.00834, 0.025, 0.0025];
    for i = 1:ps
        V(2:30)   = x(i,1:29)+ 1j*x(i,30:58);
        Psp(2:30) = x(i,59:87);
        Qsp(2:30) = x(i,88:116);
        Pg([2,13,22,23,27]) = x(i,117:121);
        Qg([2,13,22,23,27]) = x(i,122:126);
    %% current calculation
        I    = Y*V;
        Ir   = real(I);
        Im   = imag(I);
        spI  = conj((Psp+1j*Qsp)./V);
        spIr = real(spI);
        spIm = imag(spI);
        delP = Psp-Pg+P;
        delQ = Qsp-Qg+Q;
        delIr = Ir-spIr;
        delIm = Im-spIm;
        Pg(1)= real(V(1).*conj(I(1)));
    %% objective calculation
       f(i,1) = sum(a1 + b1.*Pg(ng)' + c1.*(Pg(ng).^2)')+0.75.*sum(Pg-P);
       h(i,:) = [delIr(2:30)',delIm(2:30)',delP(2:30)',delQ(2:30)'];
    end
    g = zeros(ps,1);
end

if (prob_k == 40)
    %% Microgrid Power flow (Islanded case)
   if initial_flag == 0
        P = load('input data\FunctionPS2_P.txt');
        Q = load('input data\FunctionPS2_Q.txt');
        L = load('input data\FunctionPS14_linedata.txt');
        initial_flag = 1;
   end
    %% voltage initilization
    V = zeros(38,1);
    V(1)    = 1;
    Pc     = zeros(38,1);
    Qc     = zeros(38,1);
    for i = 1:ps
        V(2:38)   = x(i,1:37)+1j*x(i,38:74);
        Pc([34,35,36,37,38]) = 1./[5.102e-03;1.502e-03;4.506e-03;2.253e-03;2.253e-03];
        Qc([34,35,36,37,38]) = 1./[0.05;0.03;0.05;0.01;0.1];
        w         = x(i,75);
        V(1)      = x(i,76)+1e-5; 
    %% current calculation
        Y    = ybus(L,w);
        I    = Y*V;
        Ir   = real(I);
        Im   = imag(I);
        Vr   = real(V);
        Vm   = imag(V);
        Psp  = Pc.*(1-w)-P(:,1).*(abs(V)./P(:,5)).^P(:,6);
        Qsp  = Qc.*(1-sqrt(Vr.^2+Vm.^2))-Q(:,1).*(abs(V)./Q(:,5)).^Q(:,6);
        spI  = conj((Psp+1j*Qsp)./V);
        spIr = real(spI);
        spIm = imag(spI);
        delIr = Ir-spIr;
        delIm = Im-spIm;
        delP2 = Psp-(Vr.*Ir+Vm.*Im);
        delQ2 = Qsp-(Vm.*Ir-Vr.*Im);
    %% objective calculation
       f(i,1) = sum(delP2(1:38).^2)+sum(delQ2(1:38).^2) ;
       h(i,:) = [delIr(1:38)',delIm(1:38)'];
    end
    g = zeros(ps,1); 
end

if (prob_k == 41)
    %% Microgrid Power flow (Grid-connected case)
   if initial_flag == 0
        G = load('input data\FunctionPS2_G.txt');
        B = load('input data\FunctionPS2_B.txt');
        P = load('input data\FunctionPS2_P.txt');
        Q = load('input data\FunctionPS2_Q.txt');
        initial_flag = 1;
    end
    Y = G+1j*B;
    %% voltage initilization
    V       = zeros(38,1);
    V(1)    = 1;
    Pdg     = zeros(38,1);
    Qdg     = zeros(38,1);
    Pdg([34,35,36,37,38]) = 0.2;
    Qdg([34,35,36,37,38]) = 0.18;
    for i = 1:ps
        V(2:38)   = x(i,1:37)+1j*x(i,38:74);
    %% current calculation
        I    = Y*V;
        Ir   = real(I);
        Im   = imag(I);
        Vr   = real(V);
        Vm   = imag(V);
        Psp = Pdg-P(:,1).*(abs(V)./P(:,5)).^P(:,6);
        Qsp = Qdg-Q(:,1).*(abs(V)./Q(:,5)).^Q(:,6);
        spI  = conj((Psp+1j*Qsp)./V);
        spIr = real(spI);
        spIm = imag(spI);
        delIr = Ir-spIr;
        delIm = Im-spIm;
        delP = Psp-(Vr.*Ir+Vm.*Im);
        delQ = Qsp-(Vm.*Ir-Vr.*Im);
    %% objective calculation
       f(i,1) = sum(delP(2:38).^2)+sum(delQ(2:38).^2) ;
       h(i,:) = [delIr(2:38)',delIm(2:38)'];
    end
    g = zeros(ps,1); 
end

if (prob_k == 42)
    %% Optimal Setting of Droop Controller for Minimization of Active Power Loss in Islanded Microgrids
   if initial_flag == 0
        P = load('input data\FunctionPS2_P.txt');
        Q = load('input data\FunctionPS2_Q.txt');
        L = load('input data\FunctionPS14_linedata.txt');
        initial_flag = 1;
   end
    %% voltage initilization
    V = zeros(38,1);
    V(1)    = 1;
    Pc     = zeros(38,1);
    Qc     = zeros(38,1);
    for i = 1:ps
        V(2:38)   = x(i,1:37)+1j*x(i,38:74);
        w         = x(i,75);
        V(1)      = x(i,76)+1e-5;
        Pc([34,35,36,37,38]) = x(i,77:81);
        Qc([34,35,36,37,38]) = x(i,82:86);
    %% current calculation
        Y    = ybus(L,w);
        I    = Y*V;
        Ir   = real(I);
        Im   = imag(I);
        Vr   = real(V);
        Vm   = imag(V);
        Psp  = Pc.*(1-w)-P(:,1).*(abs(V)./P(:,5)).^P(:,6);
        Qsp  = Qc.*(1-sqrt(Vr.^2+Vm.^2))-Q(:,1).*(abs(V)./Q(:,5)).^Q(:,6);
        spI  = conj((Psp+1j*Qsp)./V);
        spIr = real(spI);
        spIm = imag(spI);
        delIr = Ir-spIr;
        delIm = Im-spIm;
    %% objective calculation
       f(i,1) = sum(Psp) ;
       h(i,:) = [delIr(1:38)',delIm(1:38)'];
    end
    g = zeros(ps,1); 
end

if (prob_k == 43)
    %% Optimal Setting of Droop Controller for Minimization of  Reactive Power Loss in Islanded Microgrids
    if initial_flag == 0
        P = load('input data\FunctionPS2_P.txt');
        Q = load('input data\FunctionPS2_Q.txt');
        L = load('input data\FunctionPS14_linedata.txt');
        initial_flag = 1;
   end
    %% voltage initilization
    V = zeros(38,1);
    V(1)    = 1;
    Pc     = zeros(38,1);
    Qc     = zeros(38,1);
    for i = 1:ps
        V(2:38)   = x(i,1:37)+1j*x(i,38:74);
        w         = x(i,75);
        V(1)      = x(i,76)+1e-5;
        Pc([34,35,36,37,38]) = x(i,77:81);
        Qc([34,35,36,37,38]) = x(i,82:86);
    %% current calculation
        Y    = ybus(L,w);
        I    = Y*V;
        Ir   = real(I);
        Im   = imag(I);
        Vr   = real(V);
        Vm   = imag(V);
        Psp  = Pc.*(1-w)-P(:,1).*(abs(V)./P(:,5)).^P(:,6);
        Qsp  = Qc.*(1-sqrt(Vr.^2+Vm.^2))-Q(:,1).*(abs(V)./Q(:,5)).^Q(:,6);
        spI  = conj((Psp+1j*Qsp)./V);
        spIr = real(spI);
        spIm = imag(spI);
        delIr = Ir-spIr;
        delIm = Im-spIm;
    %% objective calculation
       f(i,1) = 0.5*(sum(Qsp)+sum(Psp));
       h(i,:) = [delIr(1:38)',delIm(1:38)'];
    end
    g = zeros(ps,1); 
   
end

if(prob_k == 44)
    %% Wind Farm Layout Problem
    interval      = 15;                        
    interval_num  = fix(360 / interval);     
    cut_in_speed  = 3.5;                  
    rated_speed   = 14;                    
    cut_out_speed = 25;                   
    R             = 40;                               
    H             = 80;                               
    CT            = 0.8;                             
    a             = 1 - sqrt(1 - CT);                 
    kappa         = 0.01;                         
    minDistance   = 5 * R;                  
    N             = 15;                               
    X             = 2000;                             
    Y             = 2000;                             
    k(1 : interval_num) = 2;
    c = [7 5 5 5 5 4 5 6 7 7 8 9.5 10 8.5 8.5 6.5 4.6 2.6 8 5 6.4 5.2 4.5 3.9];
    fre = [0.0003	0.0072	0.0237	0.0242	0.0222	0.0301	0.0397	0.0268	0.0626 ...	
          0.0801	0.1025	0.1445	0.1909	0.1162	0.0793	0.0082	0.0041	0.0008 ...	
          0.0010	0.0005	0.0013	0.0031	0.0085	0.0222];
    %% Objective Function
    for i = 1:ps
        f(i,1) = - Fitness(interval_num, interval, fre, N,x(i,:), ...,
                   a, kappa, R, k, c, cut_in_speed, rated_speed, cut_out_speed, 'origin');
    end
    %% Constraint Violation
    for i = 1:(0.5*D)
        XX(:,i) = x(:,2*i-1);
        YY(:,i) = x(:,2*i);
    end
    k = 1;
    for i = 1:(0.5*D)
        for j = (i+1):(0.5*D)-1
           g(:,k) = 5*R - sqrt((XX(:,i)-XX(:,j)).^2+(YY(:,i)-YY(:,j)).^2);
           k = k+1;
        end
    end
    h = zeros(ps,1);
end

%% Power Electronic Problems		

if (prob_k == 45)
    %% SOPWM for 3-level Invereters
    m = 0.32;
    s = (-ones(1,25)).^(2:26);
    k = [5,7,11,13,17,19,23,25,29,31,35,37,41,43,47,49,53,55,59,61,65,67,71,73,77,79,83,85,91,95,97];
    for i = 1:ps
        su = 0;
        for j = 1:31
            su2 = 0;
            for l = 1:D
                su2 = su2 + s(l).*cos(k(j).*x(i,l)*pi/180);
            end
            su = su + su2.^2./k(j).^4;
        end
        f(i,1) = (su).^0.5./(sum(1./k.^4)).^0.5;
    end
    g = zeros(ps,D-1);
    for i = 1:D-1
        g(:,i) = x(:,i)-x(:,i+1)+1e-6;
    end
    h = sum(s.*cos(x*pi/180),2)-m;

end

if (prob_k == 46)
    %% SOPWM for 5-level Inverters
    m = 0.32;
    s = [1,-1,1,1,-1,1,-1,1,-1,-1,1,-1,1,1,-1,1,-1,1,-1,-1,1,-1,1,1,-1];
    k = [5,7,11,13,17,19,23,25,29,31,35,37,41,43,47,49,53,55,59,61,65,67,71,73,77,79,83,85,91,95,97];
    for i = 1:ps
        su = 0;
        for j = 1:31
            su2 = 0;
            for l = 1:D
                su2 = su2 + s(l).*cos(k(j).*x(i,l)*pi/180);
            end
            su = su + su2.^2./k(j).^4;
        end
        f(i,1) = 0.5.*(su).^0.5./(sum(1./k.^4)).^0.5;
    end
    g = zeros(ps,D-1);
    for i = 1:D-1
        g(:,i) = x(:,i)-x(:,i+1)+1e-6;
    end
    h = sum(s.*cos(x*pi/180),2)-2*m;
end

if (prob_k == 47)
    %% SOPWM for 7-level Inverters
    m = 0.36;
    s = [1,-1,1,1,1,-1,-1,-1,1,1,-1,-1,1,1,1,-1,-1,-1,1,1,-1,-1,1,1,1];
    k = [5,7,11,13,17,19,23,25,29,31,35,37,41,43,47,49,53,55,59,61,65,67,71,73,77,79,83,85,91,95,97];
    for i = 1:ps
        su = 0;
        for j = 1:31
            su2 = 0;
            for l = 1:D
                su2 = su2 + s(l).*cos(k(j).*x(i,l)*pi/180);
            end
            su = su + su2.^2./k(j).^4;
        end
        f(i,1) = 1/3.*(su).^0.5./(sum(1./k.^4)).^0.5;
    end
    g = zeros(ps,D-1);
    for i = 1:D-1
        g(:,i) = x(:,i)-x(:,i+1)+1e-6;
    end
    h = sum(s.*cos(x*pi/180),2)-3*m;    
end

if (prob_k == 48)
    %% SOPWM for 9-level Inverters
    m = 0.32;
    s = [1,1,1,1,-1,1,-1,-1,-1,1,-1,-1,1,1,1,1,-1,1,-1,-1,-1,1,-1,-1,1,1,1,1,-1,1];
    k = [5,7,11,13,17,19,23,25,29,31,35,37,41,43,47,49,53,55,59,61,65,67,71,73,77,79,83,85,91,95,97];
    for i = 1:ps
        su = 0;
        for j = 1:31
            su2 = 0;
            for l = 1:D
                su2 = su2 + s(l).*cos(k(j).*x(i,l)*pi/180);
            end
            su = su + su2.^2./k(j).^4;
        end
        f(i,1) = 1/4.*(su).^0.5./(sum(1./k.^4)).^0.5;
    end
    g = zeros(ps,D-1);
    for i = 1:D-1
        g(:,i) = x(:,i)-x(:,i+1)+1e-6;
    end
    h = sum(s.*cos(x*pi/180),2)-4*m; 
end

if (prob_k == 49)
    %% SOPWM for 11-level Inverters
    m = 0.3333;
    s = [1,-1,1,1,1,-1,-1,-1,1,1,1,1,-1,-1,1,-1,-1,-1,1,1,1,1,-1,1,1,-1,-1,1,-1,-1];
    k = [5,7,11,13,17,19,23,25,29,31,35,37,41,43,47,49,53,55,59,61,65,67,71,73,77,79,83,85,91,95,97];
    for i = 1:ps
        su = 0;
        for j = 1:31
            su2 = 0;
            for l = 1:D
                su2 = su2 + s(l).*cos(k(j).*x(i,l)*pi/180);
            end
            su = su + su2.^2./k(j).^4;
        end
        f(i,1) = 1/5.*(su).^0.5./(sum(1./k.^4)).^0.5;
    end
    g = zeros(ps,D-1);
    for i = 1:D-1
        g(:,i) = x(:,i)-x(:,i+1)+1e-6;
    end
    h = sum(s.*cos(x*pi/180),2)-5*m; 
end

if (prob_k == 50)
    %% SOPWM for 13-level Inverters
    m = 0.32;
    s = [1,1,1,-1,1,-1,1,-1,1,1,1,1,-1,-1,-1,-1,1,-1,1,-1,1,1,1,1,-1,-1,-1,1,-1,1];
    k = [5,7,11,13,17,19,23,25,29,31,35,37,41,43,47,49,53,55,59,61,65,67,71,73,77,79,83,85,91,95,97];
    for i = 1:ps
        su = 0;
        for j = 1:31
            su2 = 0;
            for l = 1:D
                su2 = su2 + s(l).*cos(k(j).*x(i,l)*pi/180);
            end
            su = su + su2.^2./k(j).^4;
        end
        f(i,1) = 1/6.*(su).^0.5./(sum(1./k.^4)).^0.5;
    end
    g = zeros(ps,D-1);
    for i = 1:D-1
        g(:,i) = x(:,i)-x(:,i+1)+1e-6;
    end
    h = sum(s.*cos(x*pi/180),2)-6*m; 
end

%% Livestock Feed Ration Optimization 		

if (prob_k == 51)
    %% Livestock Feed Ration Optimization (case 1)
    if initial_flag == 0
        P = load('input data\FunctionRM_feed.txt');
        initial_flag = 1;     
    end
    %% objective function
    f = sum(x.*repmat(P(1,:),ps,1),2);
    %% constraints
    g(:,1) = -sum(x.*repmat(P(5,:),ps,1),2)+1.090;
    g(:,2) = sum(x.*repmat(P(5,:),ps,1),2)-2.170;
    g(:,3) = -sum(x.*repmat(P(4,:),ps,1),2)+4.870;
    g(:,4) = sum(x.*repmat(P(4,:),ps,1),2)-5.200;
    g(:,5) = -sum(x.*repmat(P(6,:),ps,1),2)+0.043;
    g(:,6) = sum(x.*repmat(P(6,:),ps,1),2)-0.086; 
    g(:,7) = -sum(x.*repmat(P(7,:),ps,1),2)+0.023; 
    g(:,8) = sum(x.*repmat(P(7,:),ps,1),2)-0.046;
    g(:,9) = -sum(x(:,1:17),2)./sum(x,2)+0.295; 
    g(:,10)= sum(x(:,1:17),2)./sum(x,2)-0.36; 
    g(:,11)= -sum(x.*repmat(P(3,:),ps,1),2)./sum(x,2)+0.3; 
    g(:,12)= sum(x.*repmat(P(3,:),ps,1),2)./sum(x,2)-0.4712; 
    g(:,13)= -sum(x(:,34:59),2)+9.2; 
    g(:,14)= sum(x(:,34:59),2)-11.5; 
    h(:,1) = sum(x.*repmat(P(2,:),ps,1),2)-6.9; 
    
end

if (prob_k == 52)
    %% Livestock Feed Ration Optimization (case 2)
    if initial_flag == 0
        P = load('input data\FunctionRM_feed.txt');
        initial_flag = 1;     
    end
    %% objective function
    f = sum(x.*repmat(P(1,:),ps,1),2); 
    %% constraint
    g(:,1) = -sum(x.*repmat(P(5,:),ps,1),2)+1.280; 
    g(:,2) = sum(x.*repmat(P(5,:),ps,1),2)-2.560 ; 
    g(:,3) = -sum(x.*repmat(P(4,:),ps,1),2)+7.300; 
    g(:,4) = sum(x.*repmat(P(4,:),ps,1),2)-7.810; 
    g(:,5) = -sum(x.*repmat(P(6,:),ps,1),2)+0.005;
    g(:,6) = sum(x.*repmat(P(6,:),ps,1),2)-0.094; 
    g(:,7) = -sum(x.*repmat(P(7,:),ps,1),2)+0.031;
    g(:,8) = sum(x.*repmat(P(7,:),ps,1),2)-0.062;
    g(:,9) = -sum(x(:,1:17),2)./sum(x,2)+0.2;
    g(:,10)= sum(x(:,1:17),2)./sum(x,2)-0.24; 
    g(:,11)= -sum(x.*repmat(P(3,:),ps,1),2)./sum(x,2)+0.3;
    g(:,12)= sum(x.*repmat(P(3,:),ps,1),2)./sum(x,2)-0.4; 
    g(:,13)= -sum(x(:,34:59),2)+9.8; 
    g(:,14) = sum(x(:,34:59),2)-16.4; 
    h(:,1) = sum(x.*repmat(P(2,:),ps,1),2)-9.8; 
end


if (prob_k == 53)
    %% Livestock Feed Ration Optimization (case 3)
    if initial_flag == 0
        P = load('input data\FunctionRM_feed.txt');
        initial_flag = 1;     
    end
    %% objective function
    f = sum(x.*repmat(P(1,:),ps,1),2); 
    %% constraint
    g(:,1) = -sum(x.*repmat(P(5,:),ps,1),2)+1.170;
    g(:,2) = sum(x.*repmat(P(5,:),ps,1),2)-2.340;
    g(:,3) = -sum(x.*repmat(P(4,:),ps,1),2)+6.940; 
    g(:,4) = sum(x.*repmat(P(4,:),ps,1),2)-7.430; 
    g(:,5) = -sum(x.*repmat(P(6,:),ps,1),2)+0.038; 
    g(:,6) = sum(x.*repmat(P(6,:),ps,1),2)-0.076;
    g(:,7) = -sum(x.*repmat(P(7,:),ps,1),2)+0.034; 
    g(:,8) = sum(x.*repmat(P(7,:),ps,1),2)-0.068;
    g(:,9) = -sum(x(:,1:17),2)./sum(x,2)+0.085;
    g(:,10)= sum(x(:,1:17),2)./sum(x,2)-0.111;
    g(:,11)= -sum(x.*repmat(P(3,:),ps,1),2)./sum(x,2)+0.25;
    g(:,12)= sum(x.*repmat(P(3,:),ps,1),2)./sum(x,2)-0.4;
    g(:,13)= -sum(x(:,34:59),2)+11.6;
    g(:,14)= sum(x(:,34:59),2)-14.5; 
    h(:,1) = sum(x.*repmat(P(2,:),ps,1),2)-8.7; 
end

if (prob_k == 54)
    %% Livestock Feed Ration Optimization (case 4)
    if initial_flag == 0
        P = load('input data\FunctionRM_feed.txt');
        initial_flag = 1;     
    end
    %% objective function
    f = sum(x.*repmat(P(1,:),ps,1),2); 
    %% constraints
    g(:,1) = -sum(x.*repmat(P(5,:),ps,1),2) + 0.56 ; 
    g(:,2) = sum(x.*repmat(P(5,:),ps,1),2) - 1.12 ; 
    g(:,3) = -sum(x.*repmat(P(4,:),ps,1),2) + 3.23 ; 
    g(:,4) = sum(x.*repmat(P(4,:),ps,1),2) - 3.46 ; 
    g(:,5) = -sum(x.*repmat(P(6,:),ps,1),2) + 0.018 ;
    g(:,6) = sum(x.*repmat(P(6,:),ps,1),2) - 0.036 ;
    g(:,7) = -sum(x.*repmat(P(7,:),ps,1),2) + 0.0116 ;
    g(:,8) = sum(x.*repmat(P(7,:),ps,1),2) - 0.040 ; 
    g(:,9) = -sum(x(:,1:17),2)./sum(x,2) + 0.25 ; 
    g(:,10) = sum(x(:,1:17),2)./sum(x,2) - 0.9 ; 
    g(:,11) = -sum(x.*repmat(P(3,:),ps,1),2)./sum(x,2) + 0.3; 
    g(:,12) = sum(x.*repmat(P(3,:),ps,1),2)./sum(x,2) - 0.4384; 
    g(:,13) = -sum(x(:,34:59),2) + 7.470; 
    g(:,14) = sum(x(:,34:59),2) - 9.340; 
    h(:,1) = sum(x.*repmat(P(2,:),ps,1),2)-5.6; 

end

if (prob_k == 55)
    %% Livestock Feed Ration Optimization (case 5)
    if initial_flag == 0
        P = load('input data\FunctionRM_dairy.txt');
        initial_flag = 1;     
    end
    %% objective function
    f = sum(x.*repmat(P(1,:),ps,1),2); 
    %% constraints
    h(:,1)   =  sum(x.*repmat(P(12,:),ps,1),2)-25.67;
    h(:,2)   =  sum(x.*repmat(P(2,:),ps,1),2)-0.0218;
    h(:,3)   =  sum(x.*repmat(P(3,:),ps,1),2)-0.062;
    h(:,4)   =  sum(x.*repmat(P(13,:),ps,1),2)-0.034; 
    h(:,5)   =  sum(x.*repmat(P(14,:),ps,1),2)-0.021;
    h(:,6)   =  sum(repmat(sum(P(2:11,:),1),ps,1).*x,2)-0.999; 
    g        =  zeros(ps,1);
end

if (prob_k == 56)
    %% Livestock Feed Ration Optimization (case 6)
    if initial_flag == 0
        P = load('input data\FunctionRM_dairy.txt');
        initial_flag = 1;     
    end
    %% objective function
    f = sum(x.*repmat(P(1,:),ps,1),2); 
    %% constraints
    h(:,1)   =  sum(x.*repmat(P(12,:),ps,1),2)-65.24;
    h(:,2)   =  sum(x.*repmat(P(2,:),ps,1),2)-0.066; 
    h(:,3)   =  sum(x.*repmat(P(3,:),ps,1),2)-0.159; 
    h(:,4)   =  sum(x.*repmat(P(13,:),ps,1),2)-0.103;
    h(:,5)   =  sum(x.*repmat(P(14,:),ps,1),2)-0.052; 
    h(:,6)   =  sum(repmat(sum(P(2:11,:),1),ps,1).*x,2)-2.644; 
    g        =  zeros(ps,1);
end

if (prob_k == 57)
    %% Livestock Feed Ration Optimization (case 7)
    if initial_flag == 0
        P = load('input data\FunctionRM_dairy.txt');
        initial_flag = 1;     
    end
    %% objective function
    f = sum(x.*repmat(P(1,:),ps,1),2); 
    %% constraints
    h(:,1)   =  sum(x.*repmat(P(12,:),ps,1),2)-30.05; 
    h(:,2)   =  sum(x.*repmat(P(2,:),ps,1),2)-0.0259;
    h(:,3)   =  sum(x.*repmat(P(3,:),ps,1),2)-0.077;
    h(:,4)   =  sum(x.*repmat(P(13,:),ps,1),2)-0.096; 
    h(:,5)   =  sum(x.*repmat(P(14,:),ps,1),2)-0.025;
    h(:,6)   =  sum(repmat(sum(P(2:11,:),1),ps,1).*x,2)-1.214; 
    g        =  zeros(ps,1);
end


% g=g';
% h=h';

end

% Program to for Admittance And Impedance Bus Formation....

function Y = ybus(linedata,f)  % Returns Y
linedata(:,4) = linedata(:,4).*f;
% linedata(:,3:4) = linedata(:,3:4).*10000/127^2;
% linedata(:,3:4) = linedata(:,3:4);


fb = linedata(:,1);             % From bus number...
tb = linedata(:,2);             % To bus number...
r = linedata(:,3);              % Resistance, R...
x = linedata(:,4);              % Reactance, X...
b = linedata(:,5);              % Ground Admittance, B/2...
a = linedata(:,6);              % Tap setting value..
z = r + i*x;                    % z matrix...
y = 1./z;                       % To get inverse of each element...
b = i*b;                        % Make B imaginary...

nb = max(max(fb),max(tb));      % No. of buses...
nl = length(fb);                % No. of branches...
Y = zeros(nb,nb);               % Initialise YBus...
 
 % Formation of the Off Diagonal Elements...
 for k = 1:nl
     Y(fb(k),tb(k)) = Y(fb(k),tb(k)) - y(k)/a(k);
     Y(tb(k),fb(k)) = Y(fb(k),tb(k));
 end
 
 % Formation of Diagonal Elements....
 for m = 1:nb
     for n = 1:nl
         if fb(n) == m
             Y(m,m) = Y(m,m) + y(n)/(a(n)^2) + b(n);
         elseif tb(n) == m
             Y(m,m) = Y(m,m) + y(n) + b(n);
         end
     end
 end
end
function ff = OBJ11(x,n)
a = x(1); b = x(2); c = x(3); e = x(4); f = x(5); l = x(6); 
 Zmax = 99.9999; P = 100;
if n == 1
     fhd = @(z) P.*b.*sin(acos((a.^2+(l-z).^2+e.^2-b.^2)./(2.*a.*sqrt((l-z).^2+e.^2)))+acos((b.^2+(l-z).^2+e.^2-a.^2)./(2.*b.*sqrt((l-z).^2+e.^2))))./....
       (2.*c.*cos(acos((a.^2+(l-z).^2+e.^2-b.^2)./(2.*a.*sqrt((l-z).^2+e.^2)))+atan(e./(l-z))));
else
    fhd = @(z) -(P.*b.*sin(acos((a.^2+(l-z).^2+e.^2-b.^2)./(2.*a.*sqrt((l-z).^2+e.^2)))+acos((b.^2+(l-z).^2+e.^2-a.^2)./(2.*b.*sqrt((l-z).^2+e.^2))))./....
       (2.*c.*cos(acos((a.^2+(l-z).^2+e.^2-b.^2)./(2.*a.*sqrt((l-z).^2+e.^2)))+atan(e./(l-z)))));
end
options = optimset('Display','off');
 [~,ff]= fminbnd(fhd,0,Zmax,options); 
end

function [Weight] = function_fitness(section)

E   = 6.98*1e10;      % Young's elastic modulus (N/m^2)
A   = section;        % area of bar (m^2)
rho = 2770;           % density of material (kg/m^3)
%--------------------------------------------------------------------------
%           1         2       3       4       5     6                     
gcoord = [18.288,  18.288,  9.144,  9.144,      0,  0 
           9.144,       0,  9.144,      0,  9.144,  0];
%          1  2  3  4  5  6  7  8  9  10
element = [3, 1, 4, 2, 3, 1, 4, 3, 2, 1
           5, 3, 6, 4, 4, 2, 5, 6, 3, 4];
%--------------------------------------------------------------------------
% calculate Weight matrix
Weight = 0;
for i=1:length(element)
    nd = element(:,i);
    x  = gcoord(1,nd); y = gcoord(2,nd);
    % compute long of each bar
    le = sqrt((x(2)-x(1))^2 + (y(2)-y(1))^2);
    Weight =  Weight + rho*le*A(i);
end
end
function [c,ceq] = ConsBar10(x)
type = '2D';
E    = 6.98*1e10;      % Young's elastic modulus (N/m^2)
A    = x;
rho  = 2770;           % density of material (kg/m^3)
%--------------------------------------------------------------------------
%           1        2        3       4       5     6          
gcoord  = [18.288,  18.288,  9.144,  9.144,      0,  0 
           9.144,       0,  9.144,      0,  9.144,  0];
%          1  2  3  4  5  6  7  8  9  10
element = [3, 1, 4, 2, 3, 1, 4, 3, 2, 1
           5, 3, 6, 4, 4, 2, 5, 6, 3, 4];
nel     = length(element);    % total element
nnode   = length(gcoord);     % total node
ndof    = 2;                  % number of degree of freedom of one node
sdof    = nnode*ndof;         % total dgree of freedom of system
% plotModel( type,gcoord,element );
% calculate stiffness matrix 
[ K,M ] = Cal_K_and_M( type,gcoord,element,A,rho,E );
% add non-structural mass
addedMass = 454; %kg
for idof = 1:sdof
    M(idof,idof) = M(idof,idof) + addedMass;
end
% apply boundary
bcdof   = [(5:6)*2-1, (5:6)*2];     % boundary condition displacement
% Giai phuong trinh tim tri rieng va vector rieng
[omega_2,~]=eigens(K,M,bcdof); 
f=sqrt(omega_2)/2/pi;
% f(1:5)
c1 = 7/f(1) -1;
c2 = 15/f(2)-1;
c3 = 20/f(3)-1;
c = [c1,c2,c3];
ceq = [];
end

function [ K,M ] = Cal_K_and_M( type,gcoord,element,A,rho,E )
% calculate K and M
nel     = length(element);    % total element
nnode   = length(gcoord);     % total node
switch type
    case '3D'
        ndof    = 3;                  % number of degree of freedom of one node
        sdof    = nnode*ndof;         % total dgree of freedom of system
        K       = zeros(sdof,sdof);
        M       = zeros(sdof,sdof);
        for iel=1:nel
            nd = element(:,iel);
            x  = gcoord(1,nd); y = gcoord(2,nd); z = gcoord(3,nd);
            % compute long of each bar
            le = sqrt((x(2)-x(1))^2 + (y(2)-y(1))^2 + (z(2)-z(1))^2);
            % compute direction cosin
            l_ij = (x(2)-x(1))/le;      % Eq.8.19
            m_ij = (y(2)-y(1))/le;      % Eq.8.19
            n_ij = (z(2)-z(1))/le;      % Eq.8.19
            % compute transform matrix
            Te = [l_ij m_ij  n_ij   0       0     0;
                0    0      0   l_ij   m_ij   n_ij];
            % compute stiffness matrix of element
            ke = A(iel)*E/le*[1 -1; -1  1];
            ke = Te'*ke*Te;
            me = rho*le*A(iel)*[2 0 0 1 0 0
                0 2 0 0 1 0;
                0 0 2 0 0 1;
                1 0 0 2 0 0;
                0 1 0 0 2 0;
                0 0 1 0 0 2]/6;
            % find index assemble
            index   = [3*nd(1)-2 3*nd(1)-1 3*nd(1)  3*nd(2)-2 3*nd(2)-1  3*nd(2)];
            % assemble ke in K
            K(index,index) = K(index,index) + ke;
            M(index,index) = M(index,index) + me;
        end
        
    case '2D'
        ndof    = 2;                  % number of degree of freedom of one node
        sdof    = nnode*ndof;         % total dgree of freedom of system
        K       = zeros(sdof,sdof);
        M       = zeros(sdof,sdof);
        for iel=1:nel
            nd = element(:,iel);
            x  = gcoord(1,nd); y = gcoord(2,nd);
            % compute long of each bar
            le = sqrt((x(2)-x(1))^2 + (y(2)-y(1))^2);
            % compute direction cosin
            l_ij = (x(2)-x(1))/le;
            m_ij = (y(2)-y(1))/le;
            % compute transform matrix
            Te = [l_ij m_ij   0      0 ;
                0    0   l_ij   m_ij];
            
            % compute stiffness matrix of element
            ke = A(iel)*E/le*[1 -1;
                -1  1];
            ke = Te'*ke*Te;
            me = rho*le*A(iel)*[2 0 1 0;
                0 2 0 1
                1 0 2 0
                0 1 0 2]/6; % lumped mass matrix
            % find index assemble
            index   = [2*nd(1)-1 2*nd(1)  2*nd(2)-1  2*nd(2)];
            % assemble ke in K
            K(index,index) = K(index,index) + ke;
            % assemble me in M
            M(index,index) = M(index,index) + me;
        end
end
end

function [L,X]=eigens(K,M,b)
  [nd,nd]=size(K);
  fdof=[1:nd]';
%
  if nargin==3
    pdof=b(:);
    fdof(pdof)=[]; 
    if nargout==2
      [X1,D]=eig(K(fdof,fdof),M(fdof,fdof));
      [nfdof,nfdof]=size(X1);
      for j=1:nfdof;
        mnorm=sqrt(X1(:,j)'*M(fdof,fdof)*X1(:,j));
        X1(:,j)=X1(:,j)/mnorm;
      end
      d=diag(D);
      [L,i]=sort(d);
      X2=X1(:,i);
      X=zeros(nd,nfdof);
      X(fdof,:)=X2;
    else
      d=eig(K(fdof,fdof),M(fdof,fdof));
      L=sort(d);
    end
  else
    if nargout==2
      [X1,D]=eig(K,M);
      for j=1:nd;
        mnorm=sqrt(X1(:,j)'*M*X1(:,j));
        X1(:,j)=X1(:,j)/mnorm;
      end
      d=diag(D);
      [L,i]=sort(d);
      X=X1(:,i);
    else
      d=eig(K,M);
      L=sort(d);
    end
  end
end


function all_power = Fitness(interval_num, interval, fre, N, coordinate, ...,
            a, kappa, R, k, c, cut_in_speed, rated_speed, cut_out_speed, evaluate_method)
all_power = 0;                 
for i = 1 : interval_num
   interval_dir = (i - 0.5) * interval;
   [power_eva] = eva_power(i, interval_dir, N, coordinate, ...,
            a, kappa, R,k(i), c(i), cut_in_speed, rated_speed, cut_out_speed, evaluate_method);
    all_power = all_power + fre(i) * sum(power_eva);
end
end

function power_eva = eva_power(interval_dir_num, interval_dir, N, coordinate, ...,
           a, kappa, R, k, c, cut_in_speed, rated_speed, cut_out_speed, evaluate_method)

if(strcmp(evaluate_method, 'caching'))
    [vel_def] = eva_func_deficit_caching(interval_dir_num ,N, coordinate, interval_dir, a, kappa, R);
else
    [vel_def] = eva_func_deficit(interval_dir_num, N, coordinate, interval_dir, a, kappa, R);
end
interval_c(1 : N) = 0;
for i = 1 : N
   interval_c(i) = c * (1 - vel_def(i)); 
end
n_ws = (rated_speed - cut_in_speed) / 0.3;
power_eva(1 : N) = 0;
for i = 1 : N
    for j = 1 : n_ws
        v_j_1 = cut_in_speed + (j - 1) * 0.3;
        v_j = cut_in_speed + j * 0.3;
        power_eva(i) = power_eva(i) + 1500 * exp((v_j_1 + v_j) / 2 - 7.5) ./ (5 + exp((v_j_1 + v_j) / 2 - 7.5)) * ...,
            (exp(-(v_j_1 / interval_c(i))^k) - exp(-(v_j / interval_c(i))^k));
    end
    power_eva(i) = power_eva(i) + 1500 * (exp(-(rated_speed / interval_c(i))^k) - exp(-(cut_out_speed / interval_c(i))^k));
end
end


function[vel_def] = eva_func_deficit(interval_dir_num, N, coordinate, theta, a, kappa, R)


global thetaVeldefijMatrix;

vel_def(1 : N) = 0;

for i = 1 : N
    vel_def_i = 0;
    for j = 1 : N   
        [affected, dij] = downstream_wind_turbine_is_affected(coordinate, j, i, theta, kappa, R);
        if(affected)  
            def = a / (1 + kappa * dij / R)^2;
%             def = restrict(def, 1);
            thetaVeldefijMatrix(i, j, interval_dir_num) = def;
            vel_def_i = vel_def_i + def^2;  
        else
            thetaVeldefijMatrix(i, j, interval_dir_num) = 0;
        end  
    end
%     vel_def_i = restrict(vel_def_i, 1);
    vel_def(i) = sqrt(vel_def_i);
end
end

function[vel_def] = eva_func_deficit_caching(interval_dir_num, N, coordinate, theta, a, kappa, R)

global thetaVeldefijMatrix;
global turbineMoved;

vel_def(1 : N) = 0;
movedTurbine = 1;
for i = 1 : N
    if(turbineMoved(i) == 1)
        movedTurbine = i;
    end
end

for i = 1 : N

    vel_def_i = 0;
  
    if(i ~= movedTurbine)
        [affected, dij] = downstream_wind_turbine_is_affected(coordinate, movedTurbine, i, theta, kappa, R);
        if(affected)  
            def = a / (1 + kappa * dij / R)^2;
            def = restrict(def, 1);
        else      
            def = 0;
        end 
        vel_def_i = sum((thetaVeldefijMatrix(i, :, interval_dir_num)).^2) - (thetaVeldefijMatrix(i, movedTurbine, interval_dir_num))^2 + def^2;
        thetaVeldefijMatrix(i, movedTurbine, interval_dir_num) = def;
    else
        for j = 1 : N   
            [affected, dij] = downstream_wind_turbine_is_affected(coordinate, j, i, theta, kappa, R);
            if(affected)  
                def = a / (1 + kappa * dij / R)^2;
                def = restrict(def, 1);
            else
                def = 0;      
            end
            vel_def_i = vel_def_i + def^2; 
            thetaVeldefijMatrix(i,j,interval_dir_num) = def;
        end
    end
    vel_def_i = restrict(vel_def_i, 1);
    vel_def(i) = sqrt(vel_def_i);
end
end

function[affected, dij] = downstream_wind_turbine_is_affected(coordinate, upstream_wind_turbine, ...,
    downstream_wind_turbine, theta, kappa, R)

    affected = 0;
    Tijx = (coordinate(2 * downstream_wind_turbine - 1) - coordinate(2 * upstream_wind_turbine - 1));
    Tijy = (coordinate(2 * downstream_wind_turbine) - coordinate(2 * upstream_wind_turbine));
    dij = cosd(theta) * Tijx + sind(theta) * Tijy;
    lij = sqrt((Tijx^2 + Tijy^2) - (dij)^2);
    l = dij * kappa + R;
    if((upstream_wind_turbine ~= downstream_wind_turbine) && (l > lij-R) && (dij > 0))
        affected = 1;
    end
end



%%%%%%%%%% MESH-INDEPENDENCY FILTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [dcn]=check(nelx,nely,rmin,x,dc)
dcn=zeros(nely,nelx);
for i = 1:nelx
  for j = 1:nely
    sum=0.0; 
    for k = max(i-floor(rmin),1):min(i+floor(rmin),nelx)
      for l = max(j-floor(rmin),1):min(j+floor(rmin),nely)
        fac = rmin-sqrt((i-k)^2+(j-l)^2);
        sum = sum+max(0,fac);
        dcn(j,i) = dcn(j,i) + max(0,fac)*x(l,k)*dc(l,k);
      end
    end
    dcn(j,i) = dcn(j,i)/(x(j,i)*sum);
  end
end
end
%%%%%%%%%% FE-ANALYSIS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [U]=FE(nelx,nely,x,penal)
[KE] = lk; 
K = sparse(2*(nelx+1)*(nely+1), 2*(nelx+1)*(nely+1));
F = sparse(2*(nely+1)*(nelx+1),1); U = zeros(2*(nely+1)*(nelx+1),1);
for elx = 1:nelx
  for ely = 1:nely
    n1 = (nely+1)*(elx-1)+ely; 
    n2 = (nely+1)* elx   +ely;
    edof = [2*n1-1; 2*n1; 2*n2-1; 2*n2; 2*n2+1; 2*n2+2; 2*n1+1; 2*n1+2];
    K(edof,edof) = K(edof,edof) + x(ely,elx)^penal*KE;
  end
end
% DEFINE LOADS AND SUPPORTS (HALF MBB-BEAM)
%F(2,1) = -10000;
F(2*(nely+1)*(nelx+1),1)=-10000; 
%fixeddofs   = union([1:2:2*(nely+1)],[2*(nelx+1)*(nely+1)]);
fixeddofs   = [1:2*(nely+1)];
alldofs     = [1:2*(nely+1)*(nelx+1)];
freedofs    = setdiff(alldofs,fixeddofs);
% SOLVING
U(freedofs,:) = K(freedofs,freedofs) \ F(freedofs,:);      
U(fixeddofs,:)= 0;
end
%%%%%%%%%% ELEMENT STIFFNESS MATRIX %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [KE]=lk
E = 206000000.; 
nu = 0.3;
k=[ 1/2-nu/6   1/8+nu/8 -1/4-nu/12 -1/8+3*nu/8 ... 
   -1/4+nu/12 -1/8-nu/8  nu/6       1/8-3*nu/8];
KE = E/(1-nu^2)*[ k(1) k(2) k(3) k(4) k(5) k(6) k(7) k(8)
                  k(2) k(1) k(8) k(7) k(6) k(5) k(4) k(3)
                  k(3) k(8) k(1) k(6) k(7) k(4) k(5) k(2)
                  k(4) k(7) k(6) k(1) k(8) k(3) k(2) k(5)
                  k(5) k(6) k(7) k(8) k(1) k(2) k(3) k(4)
                  k(6) k(5) k(4) k(3) k(2) k(1) k(8) k(7)
                  k(7) k(4) k(5) k(2) k(3) k(8) k(1) k(6)
                  k(8) k(3) k(2) k(5) k(4) k(7) k(6) k(1)];
end

