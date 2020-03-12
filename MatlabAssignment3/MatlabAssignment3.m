clear;

N = 1000;

pd_x1 = makedist('uniform', 'lower', 2, 'upper', 4);
pd_x2 = makedist('normal', 'mu', 2, 'sigma', 1);
pd_x3 = makedist('exponential', 'mu', 1/0.5);

X1 = random(pd_x1, N, 1);
X2 = random(pd_x2, N, 1);
X3 = random(pd_x3, N, 1);

figure
X1_sort = sort(X1);
fX1=pdf(pd_x1,X1_sort);
plot(X1_sort,fX1,'Color','r', 'LineWidth', 2);
xlabel('x','interpreter','Latex');
ylabel('Estimated $f_{X_1}(x)$','interpreter','Latex');
figure
FX1=cdf(pd_x1,X1_sort);
plot(X1_sort,FX1,'Color','r', 'LineWidth', 2);
xlabel('x','interpreter','Latex');
ylabel('Estimated $F_{X_1}(x)$','interpreter','Latex');

figure
X2_sort = sort(X2);
fX2=pdf(pd_x2,X2_sort);
plot(X2_sort,fX2,'Color','r', 'LineWidth', 2);
xlabel('x','interpreter','Latex');
ylabel('Estimated $f_{X_2}(x)$','interpreter','Latex');

figure
FX2=cdf(pd_x2,X2_sort);
plot(X2_sort,FX2,'Color','r', 'LineWidth', 2);
xlabel('x','interpreter','Latex');
ylabel('Estimated $F_{X_2}(x)$','interpreter','Latex');



figure
X3_sort = sort(X3);
fX3=pdf(pd_x3,X3_sort);
plot(X3_sort,fX3,'Color','r', 'LineWidth', 2);
xlabel('x','interpreter','Latex');
ylabel('Estimated $f_{X_3}(x)$','interpreter','Latex');

figure
FX3=cdf(pd_x3,X3_sort);
plot(X3_sort,FX3,'Color','r', 'LineWidth', 2);
xlabel('x','interpreter','Latex');
ylabel('Estimated $F_{X_3}(x)$','interpreter','Latex');


meanX1 = mean(X1);
varX1 = var(X1);
meanX1_th = (2+4)/2;
varX1_th = (4-2)^2 / 12;
str=['mean X1 Simulation: ', num2str(meanX1),' Theoretical : ',num2str(meanX1_th)];
disp(str);
str=['var X1 Simulation: ', num2str(varX1),' Theoretical : ',num2str(varX1_th)];
disp(str);

meanX2 = mean(X2);
varX2 = var(X2);
meanX2_th = 2;
varX2_th = 1;
str=['mean X2 Simulation: ', num2str(meanX2),' Theoretical : ',num2str(meanX2_th)];
disp(str);
str=['var X2 Simulation: ', num2str(varX2),' Theoretical : ',num2str(varX2_th)];
disp(str);


meanX3 = mean(X3);
varX3 = var(X3);
meanX3_th =  1/0.5;
varX3_th = 1/(0.5^2);
str=['mean X3 Simulation: ', num2str(meanX3),' Theoretical : ',num2str(meanX3_th)];
disp(str);
str=['var X3 Simulation: ', num2str(varX3),' Theoretical : ',num2str(varX3_th)];
disp(str);


Y1 = 2 * X1;
Y2 = 2*X2 - 1;

meanY1 = mean(Y1);
varY1 = var(Y1);
meanY1_th = 2 * meanX1_th;
varY1_th = 2^2 * varX1_th;
str=['mean Y1 Simulation: ', num2str(meanY1),' Theoretical : ',num2str(meanY1_th)];
disp(str);
str=['var Y1 Simulation: ', num2str(varY1),' Theoretical : ',num2str(varY1_th)];
disp(str);


meanY2 = mean(Y2);
varY2 = var(Y2);
meanY2_th = (2 * meanX2_th) - 1;
varY2_th = 2^2 * varX2_th;
str=['mean Y2 Simulation: ', num2str(meanY2),' Theoretical : ',num2str(meanY2_th)];
disp(str);
str=['var Y2 Simulation: ', num2str(varY2),' Theoretical : ',num2str(varY2_th)];
disp(str);

%From playing around with the values, the larger the number of samples, the
%closer the simulation results are with the theoretical results. This is in
%line with what we expect, because given a larger number of experiments,
%the more closely and accurately we can predict the results.

figure;
h1 = histogram(Y1,50);
h1.Normalization = 'probability';
%Yes this graph is in line with what I expected. Since Y1 is X1 multiplied
%by a scale factor of 2, the expected "shape" of the graph should also be a
%uniform dist. Additionally, since the range of values of Y1 is twice that
%of X1, that is 4<y<8 compared to 2<x<4, the PDF should be spread out more.
%Therefore, the "peak" value of the PDF should be roughly around half of
%X1. As we increase the number of trials/experiments, we can expect the
%shapre of Y1 to be a lot 'smoother'.
