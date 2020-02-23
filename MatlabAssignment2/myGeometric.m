function [Y,P_k1] = myGeometric(Nx,p,k1,fig, verbose)
    Y = zeros(Nx,1);
    P_k1 = 0;
    nMatches = 0;
    for i=1:Nx
        found = false;
        nTrials = 0;
        while ~found
            test = rand(1,1);
            if test < p
                found = true;
            end
            nTrials = nTrials + 1;
        end
        if nTrials == k1
            nMatches = nMatches + 1;
        end
        
        Y(i) = nTrials;
    end
    P_k1 = nMatches/Nx;
    P_k1_theoretical = p*((1-p)^(k1-1));
    if verbose
        str=['Probability [Y= ',num2str(k1),']', ' Simulation : ',...
        num2str(P_k1),' Theory : ',num2str(P_k1_theoretical)];
        disp(str);
    end
    if fig
        k=1:1000;
        Y_PMF=hist(Y,k)/Nx;
        stem(k,Y_PMF,'fill')
        xlabel('y');
        ylabel('Py(y)');
        xlim([0 100])
    end
end