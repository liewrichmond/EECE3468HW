function [Y,P_k1] = myGeometric(Nx,p,k1)
    Y = zeros(Nx,1);
    P_k1 = 0;
    for i=1:Nx
        test = rand(1,1); 
        nTrials = 1;
        while test > p
            nTrials = nTrials + 1;
            test = rand(1,1);
        end
        Y(i) = nTrials;
    end
    nMatches = 0;
    for i=1:Nx
        if Y(i) == k1
            nMatches =  nMatches + 1;
        end
    end
    P_k1 = nMatches/Nx;
    P_k1_theoretical = p*((1-p)^(k1-1));
    sprintf('Theoretical Value: %d', P_k1_theoretical)
end