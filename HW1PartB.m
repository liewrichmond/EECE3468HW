clear all
packLen = 100;
NPackets = 100;
NTrials = 100;

P1 = 0.5;

P0Given1 = 0.01;
P1Given0 = 0.03;
NCorrect = 0;

for i=1:NTrials
    bit = rand(1,packLen);
    err = rand(1,packLen);

    errorGiven1 = ((bit<P1) & (err<P0Given1));
    errorGiven0 = ((bit>P1) & (err<P1Given0));

    Nerr = nnz(errorGiven1 + errorGiven0);
    
    if(Nerr <= 5)
        NCorrect = NCorrect + 1;
    end
end
