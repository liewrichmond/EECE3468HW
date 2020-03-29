clear all;
m=3;
N=10000;
sigma =2.5;
Z=random('normal',0,1,m,N); % standard normal
%If the noise components are independent, and all have the
same standard deviation
Z=sigma*Z; % Gaussian noise with standard deviation sigma
cov_Z=Z*Z'/N; % covriance matrix of Z
% Evaluating Correlation coefficient matrix,
% all components in z has the same variance
rho_Z=cov_Z/sigma^2;%
rho_z_m = mean(rho_Z);