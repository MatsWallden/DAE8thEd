% Example 03.01 DAE 8th, Montgomery
% One-factor, ANOVA
% Testing H0: all means identical
alfa=0.05;
% The data. 
Y=[575, 542, 530, 539, 570;
565, 593, 590, 579, 610;
600, 651, 610, 637, 629;
725, 700, 715, 685, 710];

%power levels [W], corresponding to rows in Y
P=[160, 180, 200, 220];

n=size(Y,2); %number of replicates
N=size(Y,1)*size(Y,2);  %number of runs
a=length(P); % number of treatments

S_treat=sum(Y,2); %sum over replicates
S_total=sum(S_treat); %total sum

%Y_mean_treat=S_treat/n; 
%Y_mean_total=sum(Y_mean_treat);

SS_total=sum(Y(:).^2)-(S_total^2)/N;    %sum of squared error relative the total mean
SS_treat=(n^-1)*sum(sum(Y,2).^2)-(S_total^2)/N;       

dF_treat=a-1;
dF_E=N-a; 

%model SS_total=SS_treat+SS_E=> SSE=SS_total-SS_treat
SS_E=SS_total-SS_treat;

%How much of the variance can be explained this way?
%form the F-statistic
F0=(SS_treat/dF_treat)/(SS_E/dF_E); %66.80

F_ref=finv(1-0.05,dF_treat,dF_E); %3.24

%F0>>F_ref => reject H0!
