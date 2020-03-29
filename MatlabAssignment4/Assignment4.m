clear all;
%{
Since if p=0.5, both symbols are equally likely and tehrefore, the V_th
formula applies. From lecture slides, V_th = A/2 = 2.5
%}

%Initialize Constants
for sigma = 1:4
    N = 1000000;
    p = 0.5;
    A = 5;
    V_th = (A)/2;

    %Simulating RVs
    X1 = rand(1,N);
    NT1 = sum(X1<=p);
    NT0 = N - NT1;
    X = A*(X1<=p) - A*(X1>p);
    Z = random('normal', 0, sigma, 1, N);
    Y = (X+Z);

    X_S1 = A * (Y > V_th);
    X_S0 = -A * (Y < V_th);

    NS0GivenS1 = nnz(X_S1 < X);
    NS1GivenS0 = nnz(X_S0 > X);

    P_ErrGivenS1 = NS0GivenS1 / NT1;
    P_ErrGivenS0 = NS1GivenS0 / NT0;

    P_err = 0.5 * P_ErrGivenS1 + 0.5 * P_ErrGivenS0;

    %Using Eq P_err = P[S0]Q((Vth+A/sigma)) + P[S1](1-Q((Vth-A/sigma)));
    P_s0 = 0.5;
    P_s1 = 0.5;
    Q1 = 8.8417*10^-5;
    Q2 = 0.10565;
    P_err_th = P_s0*Q1 + (P_s1 * 0.10565);

    str=['Simluated P(e) sigma=', num2str(sigma), ': ', num2str(P_err),' ; Theoretical : ',num2str(P_err_th)];
    disp(str);
    disp("rho:");
    rho = corrcoef(X,Y);
    disp(mean(rho));
end

%As P(e) increases, the correlation decreases. Sigma, in this case
%represents how noisy the signal is. A higer standard deviation means a
%very noisy signal.

%Comparing to the example, the P(e) here should be slightly lower. Since
%the siga given in the example in class is 2.5 and ours is 2, we can expect
%the noise to play less of a significant part in disturbing our signal and
%therefore we should have a lower probability of error.
