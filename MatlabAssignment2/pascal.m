clear all
Nx = 10000;
nMatches = 0;
Z = zeros(Nx, 1);
for i=1:Nx
    [Y, P_k1] = myGeometric(4, 0.1, 10, false, false);
    totalTrials = sum(Y);
    if totalTrials == 10
        nMatches = nMatches +1;
    end
    Z(i) = totalTrials;
end
p = nMatches / Nx;
k=1:Nx;
Z_PMF=hist(Z,k)/Nx;
stem(k,Z_PMF,'fill')
xlim([0 200])

