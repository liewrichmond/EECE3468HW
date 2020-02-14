Sx = [-2, -1, 0, 1, 2];
Px = [0.2, 0.25, 0.1, 0.25, 0.2];
Fx = cumsum(Px);
Nt = 10000;

Sy = (Sx.^2)./2;
Py = Px;
Fy = cumsum(Py);

for k=1:Nt
    r = rand(1,1);
    check = r>Fx;
    checky = r>Fy;
    
    idx=nnz(check)+1;
    idy=nnz(check)+1;
    
    x(k) = Sx(idx);
    y(k) = Sy(idy);
end

[count, centers]=hist(x,50);
PMF_est=count/Nt;
stem(centers,PMF_est,'fill','linewidth',2)
xlabel('x','interpreter','Latex')
ylabel('Estimated $P_X[x]$','interpreter','Latex')

figure
[count, centers]=hist(y,50);
PMF_est=count/Nt;
stem(centers,PMF_est,'fill','linewidth',2)
xlabel('y','interpreter','Latex')
ylabel('Estimated $P_Y[y]$','interpreter','Latex')

